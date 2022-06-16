Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F054ED65
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 00:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B1A11A600;
	Thu, 16 Jun 2022 22:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87A11A602
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655419127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gpiqM2mypDWJgasAwwky1sMXde1m73xJMeQ2+/VVmk=;
 b=cirFFbt/1x0XTGyyPPfLQfjCESZVfpVvRuQqH89h4g/A5pUzpXTYOgbWJwp8w75fDQHsaS
 gxgTZlILgH9pEOe3cqzTS8KqHOkwiAG34V5mpFow1FDxn1tfcdrKzrkWaiXjx6+CoGRhAl
 8kKsJls5Tg1oouTc2+JnH7rA56hAJJM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-YG-2hWA3NUyufNsws4wn_w-1; Thu, 16 Jun 2022 18:38:44 -0400
X-MC-Unique: YG-2hWA3NUyufNsws4wn_w-1
Received: by mail-qk1-f198.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so3113532qkb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 15:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=zWA3h7cornmyyHIGBXb5vUkjOuPDjN/6OG+2cZ87BYQ=;
 b=o52JSDzTaibDoYH8zwgt0fJETl8DwXvGLsJ5X8M6xVPcUMCStNM/VRpdHRfqe9GG+D
 ++OYCk3vrBRm4c7fZA6MnBc3yDdlgtPpThdche7AplvFkHpYYs25imHFvM1zmCMeDsYb
 B1vl5x6Ag2iia63RJG278VJSejXynJ30UBSlU59Y3y0OUGzm4//vxDkX9c5wvqzmC1Tk
 pbrccNvLQFJm31WBl853QnsCwimsG8FuzzAmtZC7jPf/j3AwXh442m3LTHWKSmKD/7rM
 qVh03rjm+3oUgsVfvQRCQCcmX3XrdmWRDvkDMBNiHbpSd8PRpB4pmW33ADmBpHL6YZoD
 P96A==
X-Gm-Message-State: AJIora8d6vVJI34NMpifd40vKZEL+4ha61lC5JB8m1sXhsf4CF0jUUwm
 Kan365OrJDQuSN08m7sR9qgDL1o/iWDEqxcIMX+hfGfLNyCQ8V9fTRVoasNOHUKY6ixUhT4ow+Z
 Vp4nE8fY7n5CQpC/8I+bfq/QtNI5i
X-Received: by 2002:ad4:596a:0:b0:46f:6491:de1 with SMTP id
 eq10-20020ad4596a000000b0046f64910de1mr216700qvb.129.1655419124099; 
 Thu, 16 Jun 2022 15:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSsDKgF+2rQDW2quFPsaVyINnm9lG9snHOC3GcJglTQAcvyi71pFdERDOxGLG2YuDaqh2rog==
X-Received: by 2002:ad4:596a:0:b0:46f:6491:de1 with SMTP id
 eq10-20020ad4596a000000b0046f64910de1mr216682qvb.129.1655419123776; 
 Thu, 16 Jun 2022 15:38:43 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f3-20020ac84983000000b00304f98ad3c1sm2558459qtq.29.2022.06.16.15.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 15:38:43 -0700 (PDT)
Message-ID: <75c1df3e27685deca79207a5cc0e3afbeeea152a.camel@redhat.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=EF=BC=9A?= [PATCH 5/5]
 drm/nouveau: Fix spelling typo in comments
From: Lyude Paul <lyude@redhat.com>
To: 1064094935 <1064094935@qq.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 16 Jun 2022 18:38:41 -0400
In-Reply-To: <tencent_D362AE3DB129A03B459B4D23D3BED619F607@qq.com>
References: <tencent_655C23622640268A069B49A6A5ADDEECB508@qq.com>
 <d8a12051e71ec322f489beed252576e16802a172.camel@redhat.com>
 <tencent_D362AE3DB129A03B459B4D23D3BED619F607@qq.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-usS5Zxmm4P6mTcZEZDP9"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 pengfuyuan <pengfuyuan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-usS5Zxmm4P6mTcZEZDP9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

No problem! I just pushed the patch you sent separately (which I'm assuming is
the patch you previously sent in a series by mistake) so it should be all set.

On Thu, 2022-06-16 at 14:56 +0800, 1064094935 wrote:
> Hi,
> I'm very sorry, these five patches are not a series, the other four are from
> other branches. I made a mistake when submitting the patch. Can you help me
> push this to drm-misc? Or I will resubmit this patch again.
> 
> Best regards,
> pengfuyuan
> 
> ------------------ 原始邮件 ------------------
> 发件人: "Lyude Paul" <lyude@redhat.com>;
> 发送时间: 2022年5月28日(星期六) 凌晨0:27
> 收件人: "1064094935"<1064094935@qq.com>;"Ben Skeggs"<bskeggs@redhat.com>;
> 抄送: "Karol Herbst"<kherbst@redhat.com>;"David
> Airlie"<airlied@linux.ie>;"Daniel Vetter"<daniel@ffwll.ch>;"dri-devel"<dri-
> devel@lists.freedesktop.org>;"nouveau"<nouveau@lists.freedesktop.org>;"linux
> -kernel"<linux-
> kernel@vger.kernel.org>;"pengfuyuan"<pengfuyuan@kylinos.cn>;"k2ci"<kernel-
> bot@kylinos.cn>;
> 主题: Re: [PATCH 5/5] drm/nouveau: Fix spelling typo in comments
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Do you need me to push this to drm-misc? Or will this be pushed as one
> series?
> 
> On Fri, 2022-05-27 at 12:22 +0800, 1064094935@qq.com wrote:
> > From: pengfuyuan <pengfuyuan@kylinos.cn>
> > 
> > Fix spelling typo in comments.
> > 
> > Reported-by: k2ci <kernel-bot@kylinos.cn>
> > Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvhw/drf.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> > b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> > index bd0fc41446e2..d6969c0e2f29 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> > @@ -190,7 +190,7 @@
> >  #define DRF_MD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
> >  #define DRF_MD(A...) DRF_MD_(X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)
> >  
> > -/* Helper for testing against field value in aribtrary object */
> > +/* Helper for testing against field value in arbitrary object */
> >  #define DRF_TV_N(X,e,p,o,d,r, 
> > f,cmp,v)                                          \
> >         NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f,
> cmp,
> > (v))
> >  #define
> > DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)                                          \
> > @@ -198,7 +198,7 @@
> >  #define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
> >  #define DRF_TV(A...) DRF_TV_(X, ##A, DRF_TV_I, DRF_TV_N)(X, ##A)
> >  
> > -/* Helper for testing against field definition in aribtrary object */
> > +/* Helper for testing against field definition in arbitrary object */
> >  #define DRF_TD_N(X,e,p,o,d,r, 
> > f,cmp,v)                                                          \
> >         NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f,
> cmp,
> > d##_##r##_##f##_##v)
> >  #define
> >
> DRF_TD_I(X,e,p,o,d,r,i,f,cmp,v)                                             
> >              \
> 

-- 
Cheers,
Lyude Paul (she/her)
Software Engineer at Red Hat

--=-usS5Zxmm4P6mTcZEZDP9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>No problem! I just pushed the patch you sent =
separately (which I'm assuming is the patch you previously sent in a series=
 by mistake) so it should be all set.</div><div><br></div><div>On Thu, 2022=
-06-16 at 14:56 +0800, 1064094935 wrote:</div><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><d=
iv>Hi,</div><div>I'm very sorry, these five patches are not a series, the o=
ther four are from other branches. I made a mistake when submitting the pat=
ch. Can you help me push this to drm-misc? Or I will resubmit this patch ag=
ain.<br></div><div style=3D"position: relative;"><div><br></div><div>Best r=
egards,<br>pengfuyuan<br></div><div><br></div><div style=3D"font-size: 12px=
;font-family: Arial Narrow;padding:2px 0 2px 0;">------------------&nbsp;=
=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6&nbsp;------------------</div><div styl=
e=3D"font-size: 12px;background:#efefef;padding:8px;"><div><b>=E5=8F=91=E4=
=BB=B6=E4=BA=BA:</b> "Lyude Paul" &lt;lyude@redhat.com&gt;;</div><div><b>=
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>&nbsp;2022=E5=B9=B45=E6=9C=8828=E6=
=97=A5(=E6=98=9F=E6=9C=9F=E5=85=AD) =E5=87=8C=E6=99=A80:27</div><div><b>=E6=
=94=B6=E4=BB=B6=E4=BA=BA:</b>&nbsp;"1064094935"&lt;1064094935@qq.com&gt;;"B=
en Skeggs"&lt;bskeggs@redhat.com&gt;;<wbr></div><div><b>=E6=8A=84=E9=80=81:=
</b>&nbsp;"Karol Herbst"&lt;kherbst@redhat.com&gt;;"David Airlie"&lt;airlie=
d@linux.ie&gt;;"Daniel Vetter"&lt;daniel@ffwll.ch&gt;;"dri-devel"&lt;dri-de=
vel@lists.freedesktop.org&gt;;"nouveau"&lt;nouveau@lists.freedesktop.org&gt=
;;"linux-kernel"&lt;linux-kernel@vger.kernel.org&gt;;"pengfuyuan"&lt;pengfu=
yuan@kylinos.cn&gt;;"k2ci"&lt;kernel-bot@kylinos.cn&gt;;<wbr></div><div><b>=
=E4=B8=BB=E9=A2=98:</b>&nbsp;Re: [PATCH 5/5] drm/nouveau: Fix spelling typo=
 in comments</div></div><div><br></div>Reviewed-by: Lyude Paul &lt;lyude@re=
dhat.com&gt;<br><br>Do you need me to push this to drm-misc? Or will this b=
e pushed as one series?<br><br>On Fri, 2022-05-27 at 12:22 +0800, 106409493=
5@qq.com wrote:<br>&gt; From: pengfuyuan &lt;pengfuyuan@kylinos.cn&gt;<br>&=
gt; <br>&gt; Fix spelling typo in comments.<br>&gt; <br>&gt; Reported-by: k=
2ci &lt;kernel-bot@kylinos.cn&gt;<br>&gt; Signed-off-by: pengfuyuan &lt;pen=
gfuyuan@kylinos.cn&gt;<br>&gt; ---<br>&gt; &nbsp;drivers/gpu/drm/nouveau/in=
clude/nvhw/drf.h | 4 ++--<br>&gt; &nbsp;1 file changed, 2 insertions(+), 2 =
deletions(-)<br>&gt; <br>&gt; diff --git a/drivers/gpu/drm/nouveau/include/=
nvhw/drf.h<br>&gt; b/drivers/gpu/drm/nouveau/include/nvhw/drf.h<br>&gt; ind=
ex bd0fc41446e2..d6969c0e2f29 100644<br>&gt; --- a/drivers/gpu/drm/nouveau/=
include/nvhw/drf.h<br>&gt; +++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h=
<br>&gt; @@ -190,7 +190,7 @@<br>&gt; &nbsp;#define DRF_MD_(X,_1,_2,_3,_4,_5=
,_6,_7,_8,_9,_10,IMPL,...) IMPL<br>&gt; &nbsp;#define DRF_MD(A...) DRF_MD_(=
X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)<br>&gt; &nbsp;<br>&gt; -/* Helper for t=
esting against field value in aribtrary object */<br>&gt; +/* Helper for te=
sting against field value in arbitrary object */<br>&gt; &nbsp;#define DRF_=
TV_N(X,e,p,o,d,r,&nbsp;<br>&gt; f,cmp,v)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>&gt; &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NVVAL_TEST_X(DRF_RD_X(e, (p), =
(o), d##_##r&nbsp;&nbsp; ), d##_##r##_##f, cmp,<br>&gt; (v))<br>&gt; &nbsp;=
#define<br>&gt; DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>&=
gt; @@ -198,7 +198,7 @@<br>&gt; &nbsp;#define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_=
7,_8,_9,IMPL,...) IMPL<br>&gt; &nbsp;#define DRF_TV(A...) DRF_TV_(X, ##A, D=
RF_TV_I, DRF_TV_N)(X, ##A)<br>&gt; &nbsp;<br>&gt; -/* Helper for testing ag=
ainst field definition in aribtrary object */<br>&gt; +/* Helper for testin=
g against field definition in arbitrary object */<br>&gt; &nbsp;#define DRF=
_TD_N(X,e,p,o,d,r,&nbsp;<br>&gt; f,cmp,v)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; \<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NVVAL_TE=
ST_X(DRF_RD_X(e, (p), (o), d##_##r&nbsp;&nbsp; ), d##_##r##_##f, cmp,<br>&g=
t; d##_##r##_##f##_##v)<br>&gt; &nbsp;#define<br>&gt; DRF_TD_I(X,e,p,o,d,r,=
i,f,cmp,v)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&gt; &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br><br></di=
v></blockquote><div><br></div><div><span><pre>-- <br></pre><div data-evo-pa=
ragraph=3D"" class=3D"" style=3D"width: 78ch;" data-evo-signature-plain-tex=
t-mode=3D"">Cheers,</div><div data-evo-paragraph=3D"" class=3D"" style=3D"w=
idth: 78ch;"><span class=3D"Apple-tab-span" style=3D"white-space:pre">=09</=
span>Lyude Paul (she/her)</div><div data-evo-paragraph=3D"" class=3D"" styl=
e=3D"width: 78ch;"><span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>=09</span>Software Engineer at Red Hat</div></span></div></body></html>

--=-usS5Zxmm4P6mTcZEZDP9--

