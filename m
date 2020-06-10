Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01321F5680
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 16:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65E06E5B2;
	Wed, 10 Jun 2020 14:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DE56E5B2;
 Wed, 10 Jun 2020 14:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D01813F683;
 Wed, 10 Jun 2020 16:07:51 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=cBUp8KWP; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level: 
X-Spam-Status: No, score=-2.098 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxJpcjG7b0Zr; Wed, 10 Jun 2020 16:07:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id EAD063F27D;
 Wed, 10 Jun 2020 16:07:49 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 12B9A360060;
 Wed, 10 Jun 2020 16:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1591798069; bh=8qiL5qjPGzv3bLtVYtwXJ5wNZzHZnG0tAqMMAUutIxs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cBUp8KWP2ooYa39Ac9tbjspLM/yuLK2w0N1eMk3MRVE1Y9sS9h1yW/nJA54pC75Pu
 lPIARpAZoBfW6ClcuhYRU51RzGBlSuuCl15gbJIIKVz/ZvrYwdcvulsMqqKnxAMlr3
 emfIbxRETrgSllNHZzlSstArO5EkQmIngkmojtO4=
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <a8436314-260b-fadf-f280-56d39d173d26@shipmail.org>
Date: Wed, 10 Jun 2020 16:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1673935028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1673935028==
Content-Type: multipart/alternative;
 boundary="------------9CBFE70EFB7DBDC52F8480FC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9CBFE70EFB7DBDC52F8480FC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/10/20 3:54 PM, Andrey Grodzovsky wrote:
>
>
> On 6/10/20 6:15 AM, Thomas Hellström (Intel) wrote:
>>
>>
>> On 6/9/20 7:21 PM, Koenig, Christian wrote:
>>>
>>>
>>> Am 09.06.2020 18:37 schrieb "Grodzovsky, Andrey" 
>>> <Andrey.Grodzovsky@amd.com>:
>>>
>>>
>>>     On 6/5/20 2:40 PM, Christian König wrote:
>>>     > Am 05.06.20 um 16:29 schrieb Andrey Grodzovsky:
>>>     >>
>>>     >> On 5/11/20 2:45 AM, Christian König wrote:
>>>     >>> Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
>>>     >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>     >>>> ---
>>>     >>>> drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++++++++++++-
>>>     >>>> include/drm/ttm/ttm_bo_driver.h |  2 ++
>>>     >>>>   2 files changed, 23 insertions(+), 1 deletion(-)
>>>     >>>>
>>>     >>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> index c5b516f..eae61cc 100644
>>>     >>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> @@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual(struct
>>>     >>>> ttm_buffer_object *bo)
>>>     >>>> ttm_bo_unmap_virtual_locked(bo);
>>>     >>>> ttm_mem_io_unlock(man);
>>>     >>>>   }
>>>     >>>> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>>>     >>>>   +void ttm_bo_unmap_virtual_address_space(struct
>>>     ttm_bo_device *bdev)
>>>     >>>> +{
>>>     >>>> +    struct ttm_mem_type_manager *man;
>>>     >>>> +    int i;
>>>     >>>> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>>>     >>>
>>>     >>>> +    for (i = 0; i < TTM_NUM_MEM_TYPES; i++) {
>>>     >>>> +        man = &bdev->man[i];
>>>     >>>> +        if (man->has_type && man->use_type)
>>>     >>>> + ttm_mem_io_lock(man, false);
>>>     >>>> +    }
>>>     >>>
>>>     >>> You should drop that it will just result in a deadlock
>>>     warning for
>>>     >>> Nouveau and has no effect at all.
>>>     >>>
>>>     >>> Apart from that looks good to me,
>>>     >>> Christian.
>>>     >>
>>>     >>
>>>     >> As I am considering to re-include this in V2 of the
>>>     patchsets, can
>>>     >> you clarify please why this will have no effect at all ?
>>>     >
>>>     > The locks are exclusive for Nouveau to allocate/free the io
>>>     address
>>>     > space.
>>>     >
>>>     > Since we don't do this here we don't need the locks.
>>>     >
>>>     > Christian.
>>>
>>>
>>>     So basically calling unmap_mapping_range doesn't require any extra
>>>     locking around it and whatever locks are taken within the function
>>>     should be enough ?
>>>
>>>
>>>
>>> I think so, yes.
>>>
>>> Christian.
>>
>> Yes, that's true. However, without the bo reservation, nothing stops 
>> a PTE from being immediately re-faulted back again. Even while 
>> unmap_mapping_range() is running.
>>
>
> Can you explain more on this - specifically, which function to reserve 
> the BO, why BO reservation would prevent re-fault of the PTE ?
>
The bo reservation is taken in the TTM fault handler and temporarily 
blocks inserting a new PTE. So typically the bo reservation is held 
around unmap_mapping_range() and the buffer object operation that 
triggered it (typically a move or change of backing store).

/Thomas




--------------9CBFE70EFB7DBDC52F8480FC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 3:54 PM, Andrey Grodzovsky
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/10/20 6:15 AM, Thomas Hellström
        (Intel) wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 6/9/20 7:21 PM, Koenig,
          Christian wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com">
          <div dir="auto">
            <div><br>
              <div class="gmail_extra"><br>
                <div class="gmail_quote">Am 09.06.2020 18:37 schrieb
                  "Grodzovsky, Andrey" <a class="moz-txt-link-rfc2396E"
                    href="mailto:Andrey.Grodzovsky@amd.com"
                    moz-do-not-send="true">&lt;Andrey.Grodzovsky@amd.com&gt;</a>:<br
                    type="attribution">
                  <blockquote class="quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <div><font size="2"><span style="font-size:11pt">
                          <div><br>
                            On 6/5/20 2:40 PM, Christian König wrote:<br>
                            &gt; Am 05.06.20 um 16:29 schrieb Andrey
                            Grodzovsky:<br>
                            &gt;&gt;<br>
                            &gt;&gt; On 5/11/20 2:45 AM, Christian König
                            wrote:<br>
                            &gt;&gt;&gt; Am 09.05.20 um 20:51 schrieb
                            Andrey Grodzovsky:<br>
                            &gt;&gt;&gt;&gt; Signed-off-by: Andrey
                            Grodzovsky <a class="moz-txt-link-rfc2396E"
                              href="mailto:andrey.grodzovsky@amd.com"
                              moz-do-not-send="true">&lt;andrey.grodzovsky@amd.com&gt;</a><br>
                            &gt;&gt;&gt;&gt; ---<br>
                            &gt;&gt;&gt;&gt;  
                            drivers/gpu/drm/ttm/ttm_bo.c    | 22
                            +++++++++++++++++++++-<br>
                            &gt;&gt;&gt;&gt;  
                            include/drm/ttm/ttm_bo_driver.h |  2 ++<br>
                            &gt;&gt;&gt;&gt;   2 files changed, 23
                            insertions(+), 1 deletion(-)<br>
                            &gt;&gt;&gt;&gt;<br>
                            &gt;&gt;&gt;&gt; diff --git
                            a/drivers/gpu/drm/ttm/ttm_bo.c <br>
                            &gt;&gt;&gt;&gt;
                            b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                            &gt;&gt;&gt;&gt; index c5b516f..eae61cc
                            100644<br>
                            &gt;&gt;&gt;&gt; ---
                            a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                            &gt;&gt;&gt;&gt; +++
                            b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                            &gt;&gt;&gt;&gt; @@ -1750,9 +1750,29 @@ void
                            ttm_bo_unmap_virtual(struct <br>
                            &gt;&gt;&gt;&gt; ttm_buffer_object *bo)<br>
                            &gt;&gt;&gt;&gt;      
                            ttm_bo_unmap_virtual_locked(bo);<br>
                            &gt;&gt;&gt;&gt;      
                            ttm_mem_io_unlock(man);<br>
                            &gt;&gt;&gt;&gt;   }<br>
                            &gt;&gt;&gt;&gt;
                            +EXPORT_SYMBOL(ttm_bo_unmap_virtual);<br>
                            &gt;&gt;&gt;&gt;   +void
                            ttm_bo_unmap_virtual_address_space(struct
                            ttm_bo_device *bdev)<br>
                            &gt;&gt;&gt;&gt; +{<!-- --><br>
                            &gt;&gt;&gt;&gt; +    struct
                            ttm_mem_type_manager *man;<br>
                            &gt;&gt;&gt;&gt; +    int i;<br>
                            &gt;&gt;&gt;&gt;  
                            -EXPORT_SYMBOL(ttm_bo_unmap_virtual);<br>
                            &gt;&gt;&gt;<br>
                            &gt;&gt;&gt;&gt; +    for (i = 0; i &lt;
                            TTM_NUM_MEM_TYPES; i++) {<!-- --><br>
                            &gt;&gt;&gt;&gt; +        man =
                            &amp;bdev-&gt;man[i];<br>
                            &gt;&gt;&gt;&gt; +        if
                            (man-&gt;has_type &amp;&amp;
                            man-&gt;use_type)<br>
                            &gt;&gt;&gt;&gt; +           
                            ttm_mem_io_lock(man, false);<br>
                            &gt;&gt;&gt;&gt; +    }<br>
                            &gt;&gt;&gt;<br>
                            &gt;&gt;&gt; You should drop that it will
                            just result in a deadlock warning for <br>
                            &gt;&gt;&gt; Nouveau and has no effect at
                            all.<br>
                            &gt;&gt;&gt;<br>
                            &gt;&gt;&gt; Apart from that looks good to
                            me,<br>
                            &gt;&gt;&gt; Christian.<br>
                            &gt;&gt;<br>
                            &gt;&gt;<br>
                            &gt;&gt; As I am considering to re-include
                            this in V2 of the patchsets, can <br>
                            &gt;&gt; you clarify please why this will
                            have no effect at all ?<br>
                            &gt;<br>
                            &gt; The locks are exclusive for Nouveau to
                            allocate/free the io address <br>
                            &gt; space.<br>
                            &gt;<br>
                            &gt; Since we don't do this here we don't
                            need the locks.<br>
                            &gt;<br>
                            &gt; Christian.<br>
                            <br>
                            <br>
                            So basically calling unmap_mapping_range
                            doesn't require any extra <br>
                            locking around it and whatever locks are
                            taken within the function <br>
                            should be enough ?<br>
                          </div>
                        </span></font></div>
                  </blockquote>
                </div>
              </div>
            </div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">
              <div class="gmail_extra">
                <div class="gmail_quote">
                  <blockquote class="quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <div><font size="2"><span style="font-size:11pt"> </span></font></div>
                  </blockquote>
                </div>
              </div>
            </div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">I think so, yes.</div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">Christian.</div>
          </div>
        </blockquote>
        <p>Yes, that's true. However, without the bo reservation,
          nothing stops a PTE from being immediately re-faulted back
          again. Even while unmap_mapping_range() is running. </p>
      </blockquote>
      <p><br>
      </p>
      <p>Can you explain more on this - specifically, which function to
        reserve the BO, why BO reservation would prevent re-fault of the
        PTE ?</p>
    </blockquote>
    <p>The bo reservation is taken in the TTM fault handler and
      temporarily blocks inserting a new PTE. So typically the bo
      reservation is held around unmap_mapping_range() and the buffer
      object operation that triggered it (typically a move or change of
      backing store). <br>
    </p>
    <p>/Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------9CBFE70EFB7DBDC52F8480FC--

--===============1673935028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1673935028==--
