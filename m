Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9A1F520A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 12:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B756E1A7;
	Wed, 10 Jun 2020 10:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A67C6E1A7;
 Wed, 10 Jun 2020 10:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CB52A3F528;
 Wed, 10 Jun 2020 12:15:44 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=LssQElC0; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level: 
X-Spam-Status: No, score=-2.098 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lwl8ED8-yITS; Wed, 10 Jun 2020 12:15:43 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id ABD1B3F520;
 Wed, 10 Jun 2020 12:15:42 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C88EE360060;
 Wed, 10 Jun 2020 12:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1591784141; bh=dT3JdEctSByiX1xLAnOrOQyvt3Q0Ug/cZ46OWbew4lc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LssQElC0m1e4fsZnXd7JKh34MeSjpwf8zD2wGqvN2j/9w6eygwXkRGfyq7FjRSGon
 o13akxaR16OprvJppEQTu3fhZ+j9aAfiNNFovWkEgyLlo/7BXLTFxuNyWHnisyjQuA
 Uou4siUPgCIQO32xOc7mzAS+Mmq7chilOQoMzAb4=
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
Date: Wed, 10 Jun 2020 12:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
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
Content-Type: multipart/mixed; boundary="===============0353893917=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0353893917==
Content-Type: multipart/alternative;
 boundary="------------115E9B973EE48450378DE1A2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------115E9B973EE48450378DE1A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/9/20 7:21 PM, Koenig, Christian wrote:
>
>
> Am 09.06.2020 18:37 schrieb "Grodzovsky, Andrey" 
> <Andrey.Grodzovsky@amd.com>:
>
>
>     On 6/5/20 2:40 PM, Christian König wrote:
>     > Am 05.06.20 um 16:29 schrieb Andrey Grodzovsky:
>     >>
>     >> On 5/11/20 2:45 AM, Christian König wrote:
>     >>> Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
>     >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>     >>>> ---
>     >>>> drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++++++++++++-
>     >>>> include/drm/ttm/ttm_bo_driver.h |  2 ++
>     >>>>   2 files changed, 23 insertions(+), 1 deletion(-)
>     >>>>
>     >>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>     >>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>     >>>> index c5b516f..eae61cc 100644
>     >>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>     >>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>     >>>> @@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual(struct
>     >>>> ttm_buffer_object *bo)
>     >>>> ttm_bo_unmap_virtual_locked(bo);
>     >>>>       ttm_mem_io_unlock(man);
>     >>>>   }
>     >>>> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>     >>>>   +void ttm_bo_unmap_virtual_address_space(struct
>     ttm_bo_device *bdev)
>     >>>> +{
>     >>>> +    struct ttm_mem_type_manager *man;
>     >>>> +    int i;
>     >>>> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>     >>>
>     >>>> +    for (i = 0; i < TTM_NUM_MEM_TYPES; i++) {
>     >>>> +        man = &bdev->man[i];
>     >>>> +        if (man->has_type && man->use_type)
>     >>>> + ttm_mem_io_lock(man, false);
>     >>>> +    }
>     >>>
>     >>> You should drop that it will just result in a deadlock warning
>     for
>     >>> Nouveau and has no effect at all.
>     >>>
>     >>> Apart from that looks good to me,
>     >>> Christian.
>     >>
>     >>
>     >> As I am considering to re-include this in V2 of the patchsets, can
>     >> you clarify please why this will have no effect at all ?
>     >
>     > The locks are exclusive for Nouveau to allocate/free the io address
>     > space.
>     >
>     > Since we don't do this here we don't need the locks.
>     >
>     > Christian.
>
>
>     So basically calling unmap_mapping_range doesn't require any extra
>     locking around it and whatever locks are taken within the function
>     should be enough ?
>
>
>
> I think so, yes.
>
> Christian.

Yes, that's true. However, without the bo reservation, nothing stops a 
PTE from being immediately re-faulted back again. Even while 
unmap_mapping_range() is running. So the device removed flag needs to be 
advertized before this function is run, (perhaps with a memory barrier 
pair). That should probably be added to the function documentation.

(Other than that, please add a commit message if respinning).

/Thomas




--------------115E9B973EE48450378DE1A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:21 PM, Koenig, Christian
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div><br>
          <div class="gmail_extra"><br>
            <div class="gmail_quote">Am 09.06.2020 18:37 schrieb
              "Grodzovsky, Andrey" <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a>:<br
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
                        &gt;&gt;&gt; Am 09.05.20 um 20:51 schrieb Andrey
                        Grodzovsky:<br>
                        &gt;&gt;&gt;&gt; Signed-off-by: Andrey
                        Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a><br>
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
                        &gt;&gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                        &gt;&gt;&gt;&gt; index c5b516f..eae61cc 100644<br>
                        &gt;&gt;&gt;&gt; ---
                        a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                        &gt;&gt;&gt;&gt; +++
                        b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                        &gt;&gt;&gt;&gt; @@ -1750,9 +1750,29 @@ void
                        ttm_bo_unmap_virtual(struct <br>
                        &gt;&gt;&gt;&gt; ttm_buffer_object *bo)<br>
                        &gt;&gt;&gt;&gt;      
                        ttm_bo_unmap_virtual_locked(bo);<br>
                        &gt;&gt;&gt;&gt;       ttm_mem_io_unlock(man);<br>
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
                        &gt;&gt;&gt;&gt; +        if (man-&gt;has_type
                        &amp;&amp; man-&gt;use_type)<br>
                        &gt;&gt;&gt;&gt; +           
                        ttm_mem_io_lock(man, false);<br>
                        &gt;&gt;&gt;&gt; +    }<br>
                        &gt;&gt;&gt;<br>
                        &gt;&gt;&gt; You should drop that it will just
                        result in a deadlock warning for <br>
                        &gt;&gt;&gt; Nouveau and has no effect at all.<br>
                        &gt;&gt;&gt;<br>
                        &gt;&gt;&gt; Apart from that looks good to me,<br>
                        &gt;&gt;&gt; Christian.<br>
                        &gt;&gt;<br>
                        &gt;&gt;<br>
                        &gt;&gt; As I am considering to re-include this
                        in V2 of the patchsets, can <br>
                        &gt;&gt; you clarify please why this will have
                        no effect at all ?<br>
                        &gt;<br>
                        &gt; The locks are exclusive for Nouveau to
                        allocate/free the io address <br>
                        &gt; space.<br>
                        &gt;<br>
                        &gt; Since we don't do this here we don't need
                        the locks.<br>
                        &gt;<br>
                        &gt; Christian.<br>
                        <br>
                        <br>
                        So basically calling unmap_mapping_range doesn't
                        require any extra <br>
                        locking around it and whatever locks are taken
                        within the function <br>
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
                <div><font size="2"><span style="font-size:11pt">
                    </span></font></div>
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
    <p>Yes, that's true. However, without the bo reservation, nothing
      stops a PTE from being immediately re-faulted back again. Even
      while unmap_mapping_range() is running. So the device removed flag
      needs to be advertized before this function is run, (perhaps with
      a memory barrier pair). That should probably be added to the
      function documentation. <br>
    </p>
    <p>(Other than that, please add a commit message if respinning).</p>
    <p>/Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------115E9B973EE48450378DE1A2--

--===============0353893917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0353893917==--
