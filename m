Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6D553A7A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BD510E1D4;
	Tue, 21 Jun 2022 19:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D195410E1D4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655839529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qiXSjQQfqZLCASmBk7MRhG2o710aMB7RVeVD+REsUs=;
 b=FYHThxUbz6FvgsBQvZduvMn/JqsiagePzuIAcZuvCGrW60cmdoqquj19ErR+SYtz9dPi7j
 dmUgP8OYaDqGvMJTk5uFH4biU51Ukqhk6mOe84K5Q8mnus4HvgBhCSzW2ISpzMvTo1648G
 7Dv1ljk4naD8B6FrEwHAYaksUIjuCLA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-RddmbF3qNE6_xx7165POHg-1; Tue, 21 Jun 2022 15:25:28 -0400
X-MC-Unique: RddmbF3qNE6_xx7165POHg-1
Received: by mail-qv1-f72.google.com with SMTP id
 x18-20020a0ce252000000b004703cbb92ebso8086601qvl.21
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=zXIsJNAI8ljCwpFFP+hzb/cR+LsGDBQZLy0IAHuvCCE=;
 b=xvWziRcP66gEDC3P3VsTZdQz6ooC5rf8yQbYTT7y0DjskwP1lq+lWVIVCBNRK8WB5T
 CP58NZ0wk45aDeVw/IttG0Oj+/J4CzKN8thfPncUrHrQ4mhbu0XEuLWA3IRolAKy+oi4
 NSllUersYDSnr/KRqB3GXESMjFVnejlZp3OFremKzLwAd5VV0zV24fOe9WEr9s/5Be2X
 pH2Sr4ueTAIWHPpV9DoXqBSdyrWB7blR86Yp3yziqzYuLRQHFE6WOMRnC3fMi/TzuoM0
 1dTNUZH/fXNBxPnZuGLkqrMxXedz0P7f85DQlBYXaT2p3J3A7XuuVNEbRJ3loNu4RfNY
 1sww==
X-Gm-Message-State: AJIora95ZLBMy/QlV4Ohto7zbQ5OZL8WjSDUFmHpAJfG9A+S/oR9Won6
 xMUgYpgOK/nXkfJ7h/EL0bcciXoDQ61bUF1cgQWIgzp71f7o8qsXRtw1MX91VHMIejPvsKebFh9
 3yhlQD6E+FeltlqNHLzfNvGUm7PCA
X-Received: by 2002:ad4:5f86:0:b0:46b:9505:5a27 with SMTP id
 jp6-20020ad45f86000000b0046b95055a27mr24646973qvb.2.1655839527861; 
 Tue, 21 Jun 2022 12:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEQMW+vx2g0gsUTevFPfQstlITTWC5tO9U+Di3tC2fZPcEi7xy1zB0HfyAaAAP5rQEfb1rhA==
X-Received: by 2002:ad4:5f86:0:b0:46b:9505:5a27 with SMTP id
 jp6-20020ad45f86000000b0046b95055a27mr24646944qvb.2.1655839527497; 
 Tue, 21 Jun 2022 12:25:27 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05620a268500b006a708baa069sm15109573qkp.101.2022.06.21.12.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 12:25:26 -0700 (PDT)
Message-ID: <f9e3b3d09ba4f42bbf622d75ffab11617eca9121.camel@redhat.com>
Subject: Re: [PATCH] drm/display: drop unexpected word "the" in the comments
From: Lyude Paul <lyude@redhat.com>
To: =?UTF-8?Q?=E8=92=8B=E5=81=A5?= <jiangjian@cdjrlc.com>, airlied
 <airlied@linux.ie>, daniel <daniel@ffwll.ch>
Date: Tue, 21 Jun 2022 15:25:25 -0400
In-Reply-To: <tencent_4931D2422BB42C0F5EC65FB6@qq.com>
References: <tencent_75048D7D599E2B8C3256522A@qq.com>
 <tencent_4931D2422BB42C0F5EC65FB6@qq.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-0T4yvkKBst2j2cDfc2wG"
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
Cc: "jani.nikula" <jani.nikula@intel.com>, dianders <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-0T4yvkKBst2j2cDfc2wG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Yeah I'm not totally sure what's going on here, I wouldn't worry about it too
much. I will just push the patches manually

On Wed, 2022-06-22 at 03:01 +0800, 蒋健 wrote:
> I got the list as follow:
>  ~/linux-kernel/linux-next  on master ⇡1  ./scripts/get_maintainer.pl
> 0001-drm-display-Remove-duplicate-the-in-two-places.patch
> David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> Jani Nikula <jani.nikula@intel.com>
> (commit_signer:8/21=38%,authored:5/21=24%)
> Lyude Paul <lyude@redhat.com> (commit_signer:7/21=33%,authored:2/21=10%)
> Thomas Zimmermann <tzimmermann@suse.de>
> (commit_signer:5/21=24%,authored:5/21=24%)
> Douglas Anderson <dianders@chromium.org>
> (commit_signer:5/21=24%,authored:3/21=14%)
> "Ville Syrjälä" <ville.syrjala@linux.intel.com> (commit_signer:5/21=24%)
> Imre Deak <imre.deak@intel.com> (authored:2/21=10%)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> Submit patch CMD as follow:
> "git send-email 0001-drm-display-Remove-duplicate-the-in-two-places.patch --
> to airlied@linux.ie,daniel@ffwll.ch --cc
> jani.nikula@intel.com,lyude@redhat.com,tzimmermann@suse.de,dianders@chromium
> .org,ville.syrjala@linux.intel.com,imre.deak@intel.com,dri-
> devel@lists.freedesktop.org,linux-kernel@vger.kernel.org "
> 
>  
> ------------------ Original ------------------
> From:  "蒋健"<jiangjian@cdjrlc.com>;
> Date:  Wed, Jun 22, 2022 02:47 AM
> To:  "Lyude Paul"<lyude@redhat.com>; "airlied"<airlied@linux.ie>;
> "daniel"<daniel@ffwll.ch>; 
> Cc:  "jani.nikula"<jani.nikula@intel.com>;
> "ville.syrjala"<ville.syrjala@linux.intel.com>;
> "tzimmermann"<tzimmermann@suse.de>; "dianders"<dianders@chromium.org>;
> "imre.deak"<imre.deak@intel.com>; "dri-devel"<dri-
> devel@lists.freedesktop.org>; 
> Subject:  Re: [PATCH] drm/display: drop unexpected word "the" in the
> comments
>  
> Okay,I will submit a new patch immediately.
> 
> 
> 发自我的企业微信 
> 
> ----------Reply to Message----------
> On Wed,Jun 22,2022 2:41 AM Lyude Paul <lyude@redhat.com> wrote:
> You can send it by adding email addresses to git send-email with the "--to
> foo@bar.net" argument. If it doesn't come up on patchwork the second try
> don't worry about it, I'll look and see if I can workaround it. TBH I'm not
> entirely sure why it didn't show up in the first place
> 
> On Wed, 2022-06-22 at 02:38 +0800, 蒋健 wrote:
> > I need resubmit a new patch,  how can i make sure dri-devel@  is
> > explicitly？I got to:list by the script
> >  name of get_maintainer.pl.
> > Pls help me…
> > 
> > 
> > 发自我的企业微信 
> > 
> > ----------Reply to Message----------
> > On Wed,Jun 22,2022 2:07 AM Lyude Paul <lyude@redhat.com> wrote:
> > Actually I hate to ask but could you resend this and the other patch that
> > you
> > sent and make sure that dri-devel@ is explicitly in the to: list? For some
> > reason these patches don't seem to be coming up on patchwork
> > 
> > On Tue, 2022-06-21 at 13:54 -0400, Lyude Paul wrote:
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > 
> > > Will push to the appropriate branch in a moment
> > > 
> > > On Tue, 2022-06-21 at 21:14 +0800, Jiang Jian wrote:
> > > > there is an unexpected word "the" in the comments that need to be
> > dropped
> > > > 
> > > > file: drivers/gpu/drm/display/drm_dp_helper.c
> > > > line: 1600
> > > >   * Doesn't account the the "MOT" bit, and instead assumes each
> > > > changed to
> > > >   * Doesn't account the "MOT" bit, and instead assumes each
> > > > 
> > > > Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > index e7c22c2ca90c..499f75768523 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > @@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const
> > struct
> > > > drm_dp_aux_msg *msg)
> > > >   * Calculate the length of the i2c transfer in usec, assuming
> > > >   * the i2c bus speed is as specified. Gives the the "worst"
> > > >   * case estimate, ie. successful while as long as possible.
> > > > - * Doesn't account the the "MOT" bit, and instead assumes each
> > > > + * Doesn't account the "MOT" bit, and instead assumes each
> > > >   * message includes a START, ADDRESS and STOP. Neither does it
> > > >   * account for additional random variables such as clock stretching.
> > > >   */
> > > 
> > 

-- 
Cheers,
Lyude Paul (she/her)
Software Engineer at Red Hat

--=-0T4yvkKBst2j2cDfc2wG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Yeah I'm not totally sure what's going on her=
e, I wouldn't worry about it too much. I will just push the patches manuall=
y</div><div><br></div><div>On Wed, 2022-06-22 at 03:01 +0800, =E8=92=8B=E5=
=81=A5 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><div><font><div>I got the lis=
t as follow:</div><div>=EE=82=B2 ~/linux-kernel/linux-next =EE=82=B1 on mas=
ter =E2=87=A11 =EE=82=B0 ./scripts/get_maintainer.pl 0001-drm-display-Remov=
e-duplicate-the-in-two-places.patch</div><div>David Airlie &lt;airlied@linu=
x.ie&gt; (maintainer:DRM DRIVERS)</div><div>Daniel Vetter &lt;daniel@ffwll.=
ch&gt; (maintainer:DRM DRIVERS)</div><div>Jani Nikula &lt;jani.nikula@intel=
.com&gt; (commit_signer:8/21=3D38%,authored:5/21=3D24%)</div><div>Lyude Pau=
l &lt;lyude@redhat.com&gt; (commit_signer:7/21=3D33%,authored:2/21=3D10%)</=
div><div>Thomas Zimmermann &lt;tzimmermann@suse.de&gt; (commit_signer:5/21=
=3D24%,authored:5/21=3D24%)</div><div>Douglas Anderson &lt;dianders@chromiu=
m.org&gt; (commit_signer:5/21=3D24%,authored:3/21=3D14%)</div><div>"Ville S=
yrj=C3=A4l=C3=A4" &lt;ville.syrjala@linux.intel.com&gt; (commit_signer:5/21=
=3D24%)</div><div>Imre Deak &lt;imre.deak@intel.com&gt; (authored:2/21=3D10=
%)</div><div>dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)</div><=
div>linux-kernel@vger.kernel.org (open list)</div><div><br></div><div>Submi=
t patch CMD as follow:</div><div>"git send-email 0001-drm-display-Remove-du=
plicate-the-in-two-places.patch --to airlied@linux.ie,daniel@ffwll.ch --cc =
jani.nikula@intel.com,lyude@redhat.com,tzimmermann@suse.de,dianders@chromiu=
m.org,ville.syrjala@linux.intel.com,imre.deak@intel.com,dri-devel@lists.fre=
edesktop.org,linux-kernel@vger.kernel.org "</div></font></div><div><include=
tail><div><br></div><div>&nbsp;</div><div style=3D"font:Verdana normal 14px=
;color:#000;"><div style=3D"FONT-SIZE: 12px;FONT-FAMILY: Arial Narrow;paddi=
ng:2px 0 2px 0;">------------------&nbsp;Original&nbsp;------------------</=
div><div style=3D"FONT-SIZE: 12px;background:#efefef;padding:8px;"><div id=
=3D"menu_sender"><b>From: </b>&nbsp;"=E8=92=8B=E5=81=A5"&lt;jiangjian@cdjrl=
c.com&gt;;</div><div><b>Date: </b>&nbsp;Wed, Jun 22, 2022 02:47 AM</div><di=
v><b>To: </b>&nbsp;"Lyude Paul"&lt;lyude@redhat.com&gt;; "airlied"&lt;airli=
ed@linux.ie&gt;; "daniel"&lt;daniel@ffwll.ch&gt;; <wbr></div><div><b>Cc: </=
b>&nbsp;"jani.nikula"&lt;jani.nikula@intel.com&gt;; "ville.syrjala"&lt;vill=
e.syrjala@linux.intel.com&gt;; "tzimmermann"&lt;tzimmermann@suse.de&gt;; "d=
ianders"&lt;dianders@chromium.org&gt;; "imre.deak"&lt;imre.deak@intel.com&g=
t;; "dri-devel"&lt;dri-devel@lists.freedesktop.org&gt;; <wbr></div><div><b>=
Subject: </b>&nbsp;Re: [PATCH] drm/display: drop unexpected word "the" in t=
he comments</div></div><div>&nbsp;</div><div style=3D"position:relative;"><=
div id=3D"tmpcontent_res"></div><div style=3D"min-height:22px;">Okay,I will=
 submit a new patch immediately.</div><div id=3D"QQMailSignature" class=3D"=
mail-footer" aria-hidden=3D"true"><hr style=3D"margin: 0 0 10px 0;border: 0=
;border-bottom:1px solid #E6E8EB;height:0;line-height:0;font-size:0;padding=
: 20px 0 0 0;width: 40px;"><div style=3D"color:black;"><span><a contentedit=
able=3D"false" href=3D"https://work.weixin.qq.com/wework_admin/user/h5/qqma=
il_user_card/vc725f487c45791b9d" style=3D"text-decoration: none;color: #267=
EF0;">=E5=8F=91=E8=87=AA=E6=88=91=E7=9A=84=E4=BC=81=E4=B8=9A=E5=BE=AE=E4=BF=
=A1</a>&nbsp;</span></div></div><br><div id=3D"original-content"><div class=
=3D"mailplugin_quote"><div class=3D"mailplugin_quote_type" style=3D"height:=
 0px; color: rgba(0, 0, 0, 0); display: none;">----------Reply to Message--=
--------</div><div class=3D"mailplugin_quote_header" style=3D"color: rgba(1=
1, 17, 26, 0.6); font-family: PingFang SC; font-style: normal; font-weight:=
 normal; font-size: 14px; line-height: 150%;">On Wed,Jun 22,2022 2:41 AM Ly=
ude Paul &lt;lyude@redhat.com&gt; wrote:</div><div class=3D"mailplugin_quot=
e_split" style=3D"border-left: 3px solid #EAEAEA; padding-left: 9.5px; marg=
in-top: 12px;"><div>You can send it by adding email addresses to git send-e=
mail with the "--to <a href=3D"mailto:foo@bar.net">foo@bar.net</a>" argumen=
t. If it doesn't come up on patchwork the second try don't worry about it, =
I'll look and see if I can workaround it. TBH I'm not entirely sure why it =
didn't show up in the first place</div><div><br></div><div>On Wed, 2022-06-=
22 at 02:38 +0800, =E8=92=8B=E5=81=A5 wrote:</div><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><div style=3D"min-height:22px;">I need resubmit a new patch, &nbsp;how ca=
n i make sure dri-devel@ &nbsp;is explicitly=EF=BC=9FI got to:list by the s=
cript</div><div style=3D"min-height:22px;">&nbsp;name of get_maintainer.pl.=
</div><div style=3D"min-height:22px;">Pls help me=E2=80=A6</div><div aria-h=
idden=3D"true" class=3D"mail-footer" id=3D"QQMailSignature"><hr style=3D"ma=
rgin: 0 0 10px 0;border: 0;border-bottom:1px solid #E6E8EB;height:0;line-he=
ight:0;font-size:0;padding: 20px 0 0 0;width: 40px;"><div style=3D"color:bl=
ack;"><span><a contenteditable=3D"false" href=3D"https://work.weixin.qq.com=
/wework_admin/user/h5/qqmail_user_card/vc725f487c45791b9d" style=3D"text-de=
coration: none;color: #267EF0;">=E5=8F=91=E8=87=AA=E6=88=91=E7=9A=84=E4=BC=
=81=E4=B8=9A=E5=BE=AE=E4=BF=A1</a>&nbsp;</span></div></div><div><br></div><=
div id=3D"original-content"><div class=3D"mailplugin_quote"><div class=3D"m=
ailplugin_quote_type" style=3D"height: 0px; color: rgba(0, 0, 0, 0); displa=
y: none;">----------Reply to Message----------</div><div class=3D"mailplugi=
n_quote_header" style=3D"color: rgba(11, 17, 26, 0.6); font-family: PingFan=
g SC; font-style: normal; font-weight: normal; font-size: 14px; line-height=
: 150%;">On Wed,Jun 22,2022 2:07 AM Lyude Paul &lt;lyude@redhat.com&gt; wro=
te:</div><div class=3D"mailplugin_quote_split" style=3D"border-left: 3px so=
lid #EAEAEA; padding-left: 9.5px; margin-top: 12px;">Actually I hate to ask=
 but could you resend this and the other patch that you<br>sent and make su=
re that dri-devel@ is explicitly in the to: list? For some<br>reason these =
patches don't seem to be coming up on patchwork<br><br>On Tue, 2022-06-21 a=
t 13:54 -0400, Lyude Paul wrote:<br>&gt; Reviewed-by: Lyude Paul &lt;lyude@=
redhat.com&gt;<br>&gt; <br>&gt; Will push to the appropriate branch in a mo=
ment<br>&gt; <br>&gt; On Tue, 2022-06-21 at 21:14 +0800, Jiang Jian wrote:<=
br>&gt; &gt; there is an unexpected word "the" in the comments that need to=
 be dropped<br>&gt; &gt; <br>&gt; &gt; file: drivers/gpu/drm/display/drm_dp=
_helper.c<br>&gt; &gt; line: 1600<br>&gt; &gt;&nbsp;&nbsp; * Doesn't accoun=
t the the "MOT" bit, and instead assumes each<br>&gt; &gt; changed to<br>&g=
t; &gt;&nbsp;&nbsp; * Doesn't account the "MOT" bit, and instead assumes ea=
ch<br>&gt; &gt; <br>&gt; &gt; Signed-off-by: Jiang Jian &lt;jiangjian@cdjrl=
c.com&gt;<br>&gt; &gt; ---<br>&gt; &gt;&nbsp; drivers/gpu/drm/display/drm_d=
p_helper.c | 2 +-<br>&gt; &gt;&nbsp; 1 file changed, 1 insertion(+), 1 dele=
tion(-)<br>&gt; &gt; <br>&gt; &gt; diff --git a/drivers/gpu/drm/display/drm=
_dp_helper.c<br>&gt; &gt; b/drivers/gpu/drm/display/drm_dp_helper.c<br>&gt;=
 &gt; index e7c22c2ca90c..499f75768523 100644<br>&gt; &gt; --- a/drivers/gp=
u/drm/display/drm_dp_helper.c<br>&gt; &gt; +++ b/drivers/gpu/drm/display/dr=
m_dp_helper.c<br>&gt; &gt; @@ -1597,7 +1597,7 @@ static int drm_dp_aux_repl=
y_duration(const struct<br>&gt; &gt; drm_dp_aux_msg *msg)<br>&gt; &gt;&nbsp=
;&nbsp; * Calculate the length of the i2c transfer in usec, assuming<br>&gt=
; &gt;&nbsp;&nbsp; * the i2c bus speed is as specified. Gives the the "wors=
t"<br>&gt; &gt;&nbsp;&nbsp; * case estimate, ie. successful while as long a=
s possible.<br>&gt; &gt; - * Doesn't account the the "MOT" bit, and instead=
 assumes each<br>&gt; &gt; + * Doesn't account the "MOT" bit, and instead a=
ssumes each<br>&gt; &gt;&nbsp;&nbsp; * message includes a START, ADDRESS an=
d STOP. Neither does it<br>&gt; &gt;&nbsp;&nbsp; * account for additional r=
andom variables such as clock stretching.<br>&gt; &gt;&nbsp;&nbsp; */<br>&g=
t; <br><br></div></div></div></blockquote></div></div></div></div></div></i=
ncludetail></div></blockquote><div><br></div><div><span><pre>-- <br></pre><=
div data-evo-paragraph=3D"" class=3D"" style=3D"width: 78ch;" data-evo-sign=
ature-plain-text-mode=3D"">Cheers,</div><div data-evo-paragraph=3D"" class=
=3D"" style=3D"width: 78ch;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">=09</span>Lyude Paul (she/her)</div><div data-evo-paragraph=3D""=
 class=3D"" style=3D"width: 78ch;"><span class=3D"Apple-tab-span" style=3D"=
white-space:pre">=09</span>Software Engineer at Red Hat</div></span></div><=
/body></html>

--=-0T4yvkKBst2j2cDfc2wG--

