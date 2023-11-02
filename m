Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85337DF47B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D6510E067;
	Thu,  2 Nov 2023 14:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s01.bc.larksuite.com (s01.bc.larksuite.com [209.127.230.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4842B10E067
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=dingdao-com.20200927.dkim.feishu.cn; t=1698933766;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Q6s8qZkGWofyMlN+gFmy1GoPDhfE6EfeMK76Q9i40lc=;
 b=IYkgyovQ9txvmSZBPuLWbZa3cC4xf/Lwkh8Zr/dph5/zcbuoblfNGkV2/pPmd+aJlgdA8z
 /g1FMZy/kxCi66ejFh4VJoJ6CKOprqFQWmXOhSwr0q6HAHS5IrjKNKzfuTsXIpnU4e2Mml
 UUqzp1OpaUHJ6xElOiMyfATZd4zknE9jCtgXf5CDjKEws4KSXX4wnearFTdJCf1am1TGn8
 uQ+AGfAgBEC2JKg4ABryLeBh091EIMkRAbcvQZUWbJ0VRUtjXDh7+nQKO2+XtCOFm9Eyjv
 C9QpXfLS3iTFb7dj1vsz6pW/Q+9nEEewxKuZk56iPF9eJEQZQvxekQuLd++Hfw==
Message-Id: <5f94acf38665f92299e88c460ea01bb1bfb08824.9944fdc8.7639.450e.b7d7.3eb3618e7a7c@feishu.cn>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH] gpu/drm/drm_framebuffer.c: Use Macro instead of actual
 number.
From: =?utf-8?q?=E5=BD=AD=E6=98=8A?= <penghao@dingdao.com>
Mime-Version: 1.0
Date: Thu, 02 Nov 2023 22:02:45 +0800
In-Reply-To: <40323b1b-b2de-45b2-88f2-d6b440e10f76@suse.de>
X-Lms-Return-Path: <lba+16543ac05+0f28d5+lists.freedesktop.org+penghao@dingdao.com>
Content-Type: multipart/alternative;
 boundary=fd89cc8f7a61124bb457049c849e421629fd30f731e70045b9831a11ad4c
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--fd89cc8f7a61124bb457049c849e421629fd30f731e70045b9831a11ad4c
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Good idea!
> From: "Thomas Zimmermann"<tzimmermann@suse.de>
> Date:  Thu, Nov 2, 2023, 21:27
> Subject:  Re: [PATCH] gpu/drm/drm_framebuffer.c: Use Macro instead of actual number.
> To: "Peng Hao"<penghao@dingdao.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
> Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
> Hi
> 
> Am 02.11.23 um 03:29 schrieb Peng Hao:
> > Use Macro DRM_FORMAT_MAX_PLANES instead of 4, to improve modifiability.
> > 
> > Signed-off-by: Peng Hao <penghao@dingdao.com>
> > ---
> >   drivers/gpu/drm/drm_framebuffer.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> > index 2dd97473ca10..bf283dae9090 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -254,7 +254,7 @@ static int framebuffer_check(struct drm_device *dev,
> >   		}
> >   	}
> >   
> > -	for (i = info->num_planes; i < 4; i++) {
> > +	for (i = info->num_planes; i < DRM_FORMAT_MAX_PLANES; i++) {
> 
> This change makes the code more fragile. '4' is a fixed constant in the 
> UAPI struct, while DRM_FORMAT_MAX_PLANES is an internal constant. I 
> agree that both should reasonably have the same value. But (potentially) 
> changing the value of DRM_FORMAT_MAX_PLANES will break these loops with 
> a possible OOB access.
> 
> To make make this code more robust, it might be better to rewrite the 
> tests like this
> 
> for (i = num_planes; i < ARRAY_SIZE(r->modifier); +i) {
> 	// the test for modifier[i]
> }
> 
> if (r->flags & DRM_MODE_FB_MODIFIERS) {
>   	for (i < ARRAY_SIZE(handles)) {
> 		// test for handles[i]
> 	}
>   	for (i < ARRAY_SIZE(pitches)) {
> 		// test for pitches[i]
> 	}
>   	for (i < ARRAY_SIZE(offsets)) {
> 		// test for offsets[i]
> 	}
> }
> 
> Best regards
> Thomas
> 
> >   		if (r->modifier[i]) {
> >   			drm_dbg_kms(dev, "non-zero modifier for unused plane %d\n", i);
> >   			return -EINVAL;
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

--fd89cc8f7a61124bb457049c849e421629fd30f731e70045b9831a11ad4c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div id=3D"editor_version_1.17.2_RNzdUoaq" style=
=3D"word-break:break-word;"><div data-zone-id=3D"0" data-line-index=3D"0" d=
ata-line=3D"true" style=3D"margin-top: 4px; margin-bottom: 4px; line-height=
: 1.6;"><div class=3D"" style=3D"font-size: 16px;">Good idea!</div></div></=
div><div class=3D"history-quote-wrapper" id=3D"lark-mail-quote-169893376"><=
div style=3D"list-style-position: inside" data-html-block=3D"quote" data-ma=
il-html-ignore=3D""><div id=3D"lark-mail-quote-169893332" class=3D"history-=
quote-wrapper"></div><div style=3D"border-left: none; padding-left: 0px;" c=
lass=3D"adit-html-block adit-html-block--collapsed"><div><div style=3D"padd=
ing: 12px; background: rgb(245, 246, 247); color: rgb(31, 35, 41); border-r=
adius: 4px; margin-top: 24px; margin-bottom: 12px;" id=3D"lark-mail-quote-m=
eta-Pa9tx2gji" class=3D"adit-html-block__attr history-quote-meta-wrapper hi=
story-quote-gap-tag"><div id=3D"lark-mail-quote-c270949e0fca8af28c4d54bd92c=
63a0d"><div style=3D"word-break: break-word;"><div style=3D""><span style=
=3D"white-space:nowrap;">From: </span><span style=3D"white-space: nowrap;">=
&#34;Thomas Zimmermann&#34;&lt;<a data-mailto=3D"mailto:tzimmermann@suse.de=
" class=3D"quote-head-meta-mailto" href=3D"mailto:tzimmermann@suse.de" styl=
e=3D"overflow-wrap: break-word; white-space: pre-wrap; hyphens: none; word-=
break: break-word; cursor: pointer; text-decoration: none; color: inherit;"=
>tzimmermann@suse.de</a>&gt;</span></div><div style=3D""><span style=3D"whi=
te-space:nowrap;">Date: </span> Thu, Nov 2, 2023, 21:27</div><div style=3D"=
"><span style=3D"white-space:nowrap;">Subject: </span> Re: [PATCH] gpu/drm/=
drm_framebuffer.c: Use Macro instead of actual number.</div><div style=3D""=
><span style=3D"white-space:nowrap;">To: </span><span style=3D"white-space:=
 nowrap;">&#34;Peng Hao&#34;&lt;<a data-mailto=3D"mailto:penghao@dingdao.co=
m" class=3D"quote-head-meta-mailto" href=3D"mailto:penghao@dingdao.com" sty=
le=3D"overflow-wrap: break-word; white-space: pre-wrap; hyphens: none; word=
-break: break-word; cursor: pointer; text-decoration: none; color: inherit;=
">penghao@dingdao.com</a>&gt;</span>, <span style=3D"white-space: nowrap;">=
&lt;<a data-mailto=3D"mailto:maarten.lankhorst@linux.intel.com" class=3D"qu=
ote-head-meta-mailto" href=3D"mailto:maarten.lankhorst@linux.intel.com" sty=
le=3D"overflow-wrap: break-word; white-space: pre-wrap; hyphens: none; word=
-break: break-word; cursor: pointer; text-decoration: none; color: inherit;=
">maarten.lankhorst@linux.intel.com</a>&gt;</span>, <span style=3D"white-sp=
ace: nowrap;">&lt;<a data-mailto=3D"mailto:mripard@kernel.org" class=3D"quo=
te-head-meta-mailto" href=3D"mailto:mripard@kernel.org" style=3D"overflow-w=
rap: break-word; white-space: pre-wrap; hyphens: none; word-break: break-wo=
rd; cursor: pointer; text-decoration: none; color: inherit;">mripard@kernel=
.org</a>&gt;</span>, <span style=3D"white-space: nowrap;">&lt;<a data-mailt=
o=3D"mailto:airlied@gmail.com" class=3D"quote-head-meta-mailto" href=3D"mai=
lto:airlied@gmail.com" style=3D"overflow-wrap: break-word; white-space: pre=
-wrap; hyphens: none; word-break: break-word; cursor: pointer; text-decorat=
ion: none; color: inherit;">airlied@gmail.com</a>&gt;</span>, <span style=
=3D"white-space: nowrap;">&lt;<a data-mailto=3D"mailto:daniel@ffwll.ch" cla=
ss=3D"quote-head-meta-mailto" href=3D"mailto:daniel@ffwll.ch" style=3D"over=
flow-wrap: break-word; white-space: pre-wrap; hyphens: none; word-break: br=
eak-word; cursor: pointer; text-decoration: none; color: inherit;">daniel@f=
fwll.ch</a>&gt;</span></div><div style=3D""><span style=3D"white-space:nowr=
ap;">Cc: </span><span style=3D"white-space: nowrap;">&lt;<a data-mailto=3D"=
mailto:linux-kernel@vger.kernel.org" class=3D"quote-head-meta-mailto" href=
=3D"mailto:linux-kernel@vger.kernel.org" style=3D"overflow-wrap: break-word=
; white-space: pre-wrap; hyphens: none; word-break: break-word; cursor: poi=
nter; text-decoration: none; color: inherit;">linux-kernel@vger.kernel.org<=
/a>&gt;</span>, <span style=3D"white-space: nowrap;">&lt;<a data-mailto=3D"=
mailto:dri-devel@lists.freedesktop.org" class=3D"quote-head-meta-mailto" hr=
ef=3D"mailto:dri-devel@lists.freedesktop.org" style=3D"overflow-wrap: break=
-word; white-space: pre-wrap; hyphens: none; word-break: break-word; cursor=
: pointer; text-decoration: none; color: inherit;">dri-devel@lists.freedesk=
top.org</a>&gt;</span></div></div></div></div><div><div style=3D"white-spac=
e: pre-wrap" data-type=3D"plainText"><span>Hi

Am 02.11.23 um 03:29 schrieb Peng Hao:
&gt; Use Macro DRM_FORMAT_MAX_PLANES instead of 4, to improve modifiability=
.
&gt;=20
&gt; Signed-off-by: Peng Hao &lt;<a href=3D"mailto:penghao@dingdao.com" tar=
get=3D"_blank" ref=3D"noopener noreferrer">penghao@dingdao.com</a>&gt;
&gt; ---
&gt;   drivers/gpu/drm/drm_framebuffer.c | 2 +-
&gt;   1 file changed, 1 insertion(+), 1 deletion(-)
&gt;=20
&gt; diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_f=
ramebuffer.c
&gt; index 2dd97473ca10..bf283dae9090 100644
&gt; --- a/drivers/gpu/drm/drm_framebuffer.c
&gt; +++ b/drivers/gpu/drm/drm_framebuffer.c
&gt; @@ -254,7 +254,7 @@ static int framebuffer_check(struct drm_device *de=
v,
&gt;   		}
&gt;   	}
&gt;  =20
&gt; -	for (i =3D info-&gt;num_planes; i &lt; 4; i++) {
&gt; +	for (i =3D info-&gt;num_planes; i &lt; DRM_FORMAT_MAX_PLANES; i++) {

This change makes the code more fragile. &#39;4&#39; is a fixed constant in=
 the=20
UAPI struct, while DRM_FORMAT_MAX_PLANES is an internal constant. I=20
agree that both should reasonably have the same value. But (potentially)=20
changing the value of DRM_FORMAT_MAX_PLANES will break these loops with=20
a possible OOB access.

To make make this code more robust, it might be better to rewrite the=20
tests like this

for (i =3D num_planes; i &lt; ARRAY_SIZE(r-&gt;modifier); +i) {
	// the test for modifier[i]
}

if (r-&gt;flags &amp; DRM_MODE_FB_MODIFIERS) {
  	for (i &lt; ARRAY_SIZE(handles)) {
		// test for handles[i]
	}
  	for (i &lt; ARRAY_SIZE(pitches)) {
		// test for pitches[i]
	}
  	for (i &lt; ARRAY_SIZE(offsets)) {
		// test for offsets[i]
	}
}

Best regards
Thomas

&gt;   		if (r-&gt;modifier[i]) {
&gt;   			drm_dbg_kms(dev, &#34;non-zero modifier for unused plane %d\n&#34=
;, i);
&gt;   			return -EINVAL;

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)</span></div></div></div></div></div></div></body><=
/html>
--fd89cc8f7a61124bb457049c849e421629fd30f731e70045b9831a11ad4c--
