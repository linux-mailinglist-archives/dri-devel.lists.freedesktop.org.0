Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3439DD3C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 15:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E8B6E8B0;
	Mon,  7 Jun 2021 13:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC826E8B0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 13:01:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h8so17509935wrz.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Ip7WAmn26bJSRytvPb1CU10wgClEIXRXGPWRzCPad9c=;
 b=jfdHT1nbM35//WdF3yBp6ufe8wmBiCIUFa07l9VQ1+DHXrS6CQURgWEg8P3b0TlRHQ
 OruqJmh4D0urm/MOgdvwyUhNvhdChi7RRJFERkoPiQ27b6TJ8Jr+HG7RC1Dv5HOjHxy+
 jnA4E3i1RChSNn5DXimesC/lm4FN7MUc2PMGF0ZSlBZe1Aleh+rKdwx2UEHcE7GkrdsL
 kcY2dhBggPAO0F6HiIApMEu7vsGXGcMzWdtQTDaSfHpdRi1D/XUms80XsRTdHITsZ452
 mAK4G+IxHt5IdOce5cc3kXdpD6DLY+QbiDTHxjmxzWSlyocB7FziZMCLOo83wFB/Clev
 avtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Ip7WAmn26bJSRytvPb1CU10wgClEIXRXGPWRzCPad9c=;
 b=Ig98dZi8BXGWGXBp+Az/pZuxobFTC9pHcwR2W3+5o70J+U5p/mWwfhOmnTI7N9GA6W
 kv9vcMRGj7KHZNeVkdnp824mM/Ff++uFMeLnwWWA/bcaE9YzfRWpSVBnF1DB2e5H50X+
 XweR0RXTMF4LWGab1jokE81kSLIbGVArDnBwC8imYiPMO42K58hREKFR3Lq1SP9lL6b8
 cDdRfRl83KxfQ8ku+oBnX/47r6Lb5aTNWBgV6s4KgCgkIamK6Bv5tESneLkbzabq9Jx8
 FAZS8GX0+IsJi/0zAsENb27mGMwco0wUC453PtTfEtbwI7LmftoMl4CMgNANaYYlyXE3
 LIlA==
X-Gm-Message-State: AOAM532uCrS2pGLu9np4F/Jp4s7sWuB4vki8+bCRMh1rrG0qHbZ25tWD
 h4lX3myxCKDqXPI2evGgq0H0MvtbF8U=
X-Google-Smtp-Source: ABdhPJwk9dbXi4Wa9mAk3WvsMgrQM4gG/F+6zdl37nm056ZhmeqUYNF8MH1J9c9pyCdZwWxxzJRNtg==
X-Received: by 2002:adf:9c93:: with SMTP id d19mr16887813wre.17.1623070866798; 
 Mon, 07 Jun 2021 06:01:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id i16sm14140603wmm.9.2021.06.07.06.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:01:06 -0700 (PDT)
Subject: Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
To: Nirmoy Das <nirmoy.das@amd.com>
References: <20210601122528.1643-1-christian.koenig@amd.com>
 <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
 <0fc2844d-b954-2386-17e3-e2c4232fc247@shipmail.org>
 <f067ec3f-ae6c-fb9d-d87b-e31311bf3cf3@gmail.com>
 <DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1a18dab0-45ee-3406-05f6-fe3ae3b2d136@gmail.com>
Date: Mon, 7 Jun 2021 15:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------F01417D7F0A08938DAE2D150"
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
Cc: "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------F01417D7F0A08938DAE2D150
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nirmoy,

can you give that patch set a testing round and an review?

The memory stress test with low VRAM on APUs should be sufficient and 
you should have that setup still around.

Thanks in advance,
Christian.

Am 07.06.21 um 14:58 schrieb Yu, Lang:
>
> [AMD Official Use Only]
>
>
> Thanks，please let Nirmoy do it.
>
> Regards，
> Lang
>
> 获取 Outlook for iOS <https://aka.ms/o0ukef>
> ------------------------------------------------------------------------
> *发件人:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *发送时间:* Monday, June 7, 2021 8:41:49 PM
> *收件人:* Thomas Hellström (Intel) <thomas_os@shipmail.org>; Yu, Lang 
> <Lang.Yu@amd.com>
> *抄送:* dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *主题:* Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
> Thanks!
>
> Lang can anybody from your team give as an reviewed-by/test-by on the
> amdgpu patches? I just want another pair of eyes looking over it.
>
> If nobody else has time I will ask Nirmoy for a quick testing round.
>
> Thanks,
> Christian.
>
> Am 07.06.21 um 14:38 schrieb Thomas Hellström (Intel):
> > Sure. LGTM,
> >
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >
> >
> > On 6/7/21 2:36 PM, Christian König wrote:
> >> Thomas any comments on this?
> >>
> >> Is the purpose of this now clear enough?
> >>
> >> Thanks,
> >> Christian.
> >>
> >> Am 01.06.21 um 14:25 schrieb Christian König:
> >>> From: Lang Yu <Lang.Yu@amd.com>
> >>>
> >>> Sometimes drivers need to use bounce buffers to evict BOs. While
> >>> those reside
> >>> in some domain they are not necessarily suitable for CS.
> >>>
> >>> Add a flag so that drivers can note that a bounce buffers needs to be
> >>> reallocated during validation.
> >>>
> >>> v2: add detailed comments
> >>> v3 (chk): merge commits and rework commit message
> >>>
> >>> Suggested-by: Christian König <christian.koenig@amd.com>
> >>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> >>> Signed-off-by: Christian König <christian.koenig@amd.com>
> >>> ---
> >>>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
> >>>   include/drm/ttm/ttm_placement.h | 7 +++++--
> >>>   2 files changed, 8 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> >>> b/drivers/gpu/drm/ttm/ttm_bo.c
> >>> index 51a94fd63bd7..6b393502198e 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >>> @@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct
> >>> ttm_place *places,
> >>>   {
> >>>       unsigned i;
> >>>   +    if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> >>> +        return false;
> >>> +
> >>>       for (i = 0; i < num_placement; i++) {
> >>>           const struct ttm_place *heap = &places[i];
> >>>   diff --git a/include/drm/ttm/ttm_placement.h
> >>> b/include/drm/ttm/ttm_placement.h
> >>> index aa6ba4d0cf78..8995c9e4ec1b 100644
> >>> --- a/include/drm/ttm/ttm_placement.h
> >>> +++ b/include/drm/ttm/ttm_placement.h
> >>> @@ -47,8 +47,11 @@
> >>>    * top of the memory area, instead of the bottom.
> >>>    */
> >>>   -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
> >>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
> >>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
> >>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
> >>> +
> >>> +/* For multihop handling */
> >>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
> >>>     /**
> >>>    * struct ttm_place
>


--------------F01417D7F0A08938DAE2D150
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Nirmoy,<br>
    <br>
    can you give that patch set a testing round and an review?<br>
    <br>
    The memory stress test with low VRAM on APUs should be sufficient
    and you should have that setup still around.<br>
    <br>
    Thanks in advance,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 07.06.21 um 14:58 schrieb Yu, Lang:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM6PR12MB4250A90CF8058DD28AB1B04FFB389@DM6PR12MB4250.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p
        style="font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;"
        align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div>
          <div>
            <div dir="ltr" data-ogsc="" style="">
              <div dir="ltr" data-ogsc="" style="">Thanks，please let
                Nirmoy do it.</div>
              <div dir="ltr" data-ogsc="" style=""><br>
              </div>
              <div dir="ltr" data-ogsc="" style="">Regards，</div>
              <div dir="ltr" data-ogsc="" style="">Lang</div>
            </div>
          </div>
          <div><br>
          </div>
          <div class="ms-outlook-ios-signature">获取 <a
              href="https://aka.ms/o0ukef" moz-do-not-send="true">Outlook
              for iOS</a></div>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>发件人:</b>
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
            <b>发送时间:</b> Monday, June 7, 2021 8:41:49 PM<br>
            <b>收件人:</b> Thomas Hellström (Intel)
            <a class="moz-txt-link-rfc2396E" href="mailto:thomas_os@shipmail.org">&lt;thomas_os@shipmail.org&gt;</a>; Yu, Lang
            <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com">&lt;Lang.Yu@amd.com&gt;</a><br>
            <b>抄送:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
            <b>主题:</b> Re: [PATCH 1/4] drm/ttm: add
            TTM_PL_FLAG_TEMPORARY flag v3</font>
          <div> </div>
        </div>
        <div class="BodyFragment"><font size="2"><span
              style="font-size:11pt;">
              <div class="PlainText">Thanks!<br>
                <br>
                Lang can anybody from your team give as an
                reviewed-by/test-by on the <br>
                amdgpu patches? I just want another pair of eyes looking
                over it.<br>
                <br>
                If nobody else has time I will ask Nirmoy for a quick
                testing round.<br>
                <br>
                Thanks,<br>
                Christian.<br>
                <br>
                Am 07.06.21 um 14:38 schrieb Thomas Hellström (Intel):<br>
                &gt; Sure. LGTM,<br>
                &gt;<br>
                &gt; Reviewed-by: Thomas Hellström
                <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a><br>
                &gt;<br>
                &gt;<br>
                &gt; On 6/7/21 2:36 PM, Christian König wrote:<br>
                &gt;&gt; Thomas any comments on this?<br>
                &gt;&gt;<br>
                &gt;&gt; Is the purpose of this now clear enough?<br>
                &gt;&gt;<br>
                &gt;&gt; Thanks,<br>
                &gt;&gt; Christian.<br>
                &gt;&gt;<br>
                &gt;&gt; Am 01.06.21 um 14:25 schrieb Christian König:<br>
                &gt;&gt;&gt; From: Lang Yu <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com">&lt;Lang.Yu@amd.com&gt;</a><br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Sometimes drivers need to use bounce
                buffers to evict BOs. While <br>
                &gt;&gt;&gt; those reside<br>
                &gt;&gt;&gt; in some domain they are not necessarily
                suitable for CS.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Add a flag so that drivers can note that a
                bounce buffers needs to be<br>
                &gt;&gt;&gt; reallocated during validation.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; v2: add detailed comments<br>
                &gt;&gt;&gt; v3 (chk): merge commits and rework commit
                message<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Suggested-by: Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
                &gt;&gt;&gt; Signed-off-by: Lang Yu
                <a class="moz-txt-link-rfc2396E" href="mailto:Lang.Yu@amd.com">&lt;Lang.Yu@amd.com&gt;</a><br>
                &gt;&gt;&gt; Signed-off-by: Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
                &gt;&gt;&gt; ---<br>
                &gt;&gt;&gt;   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++<br>
                &gt;&gt;&gt;   include/drm/ttm/ttm_placement.h | 7
                +++++--<br>
                &gt;&gt;&gt;   2 files changed, 8 insertions(+), 2
                deletions(-)<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c <br>
                &gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                &gt;&gt;&gt; index 51a94fd63bd7..6b393502198e 100644<br>
                &gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                &gt;&gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                &gt;&gt;&gt; @@ -929,6 +929,9 @@ static bool
                ttm_bo_places_compat(const struct <br>
                &gt;&gt;&gt; ttm_place *places,<br>
                &gt;&gt;&gt;   {<br>
                &gt;&gt;&gt;       unsigned i;<br>
                &gt;&gt;&gt;   +    if (mem-&gt;placement &amp;
                TTM_PL_FLAG_TEMPORARY)<br>
                &gt;&gt;&gt; +        return false;<br>
                &gt;&gt;&gt; +<br>
                &gt;&gt;&gt;       for (i = 0; i &lt; num_placement;
                i++) {<br>
                &gt;&gt;&gt;           const struct ttm_place *heap =
                &amp;places[i];<br>
                &gt;&gt;&gt;   diff --git
                a/include/drm/ttm/ttm_placement.h <br>
                &gt;&gt;&gt; b/include/drm/ttm/ttm_placement.h<br>
                &gt;&gt;&gt; index aa6ba4d0cf78..8995c9e4ec1b 100644<br>
                &gt;&gt;&gt; --- a/include/drm/ttm/ttm_placement.h<br>
                &gt;&gt;&gt; +++ b/include/drm/ttm/ttm_placement.h<br>
                &gt;&gt;&gt; @@ -47,8 +47,11 @@<br>
                &gt;&gt;&gt;    * top of the memory area, instead of the
                bottom.<br>
                &gt;&gt;&gt;    */<br>
                &gt;&gt;&gt;   -#define TTM_PL_FLAG_CONTIGUOUS  (1
                &lt;&lt; 19)<br>
                &gt;&gt;&gt; -#define TTM_PL_FLAG_TOPDOWN     (1
                &lt;&lt; 22)<br>
                &gt;&gt;&gt; +#define TTM_PL_FLAG_CONTIGUOUS  (1
                &lt;&lt; 0)<br>
                &gt;&gt;&gt; +#define TTM_PL_FLAG_TOPDOWN     (1
                &lt;&lt; 1)<br>
                &gt;&gt;&gt; +<br>
                &gt;&gt;&gt; +/* For multihop handling */<br>
                &gt;&gt;&gt; +#define TTM_PL_FLAG_TEMPORARY   (1
                &lt;&lt; 2)<br>
                &gt;&gt;&gt;     /**<br>
                &gt;&gt;&gt;    * struct ttm_place<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F01417D7F0A08938DAE2D150--
