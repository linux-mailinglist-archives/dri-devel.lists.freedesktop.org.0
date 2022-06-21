Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068DB5539A7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 20:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A4510FFED;
	Tue, 21 Jun 2022 18:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91710FFA3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655836908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xbaomduX/6iNsgWJel4fsuoeUQrFoZwPYLYGvtGYPdA=;
 b=LiX6N0NEW+gnub7+dghBBC4J07+vq6hBKMxs/6mNS+Ip16qOmXACLa0tDoKleyK7LQw5kK
 +fhqJypRnr8/AhNs6+Jfjfwr9Y8e371r29qfgXbe+14SOTbAv9ihpuv/MyIjo8xWrkAfoz
 hgnMZofgC4dZPZlAg8kxnhEpEeIuFco=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-tOeVHPbUOfqzb-3mLV-M8Q-1; Tue, 21 Jun 2022 14:41:47 -0400
X-MC-Unique: tOeVHPbUOfqzb-3mLV-M8Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 kj4-20020a056214528400b0044399a9bb4cso15120493qvb.15
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=abJX6T0xADcItKdVlKQUgYBGgMLNVaj04UIgxU1/y1Q=;
 b=ASUXlRCZDUKV5AK8f0woV7jAuCZ6uj7Lp84j1S5q+grRJM/kZiYFyFwgoRwFTdVMej
 fcaIb+WZnsUt1oyTmDZ6639/kx6F0WLB2LrTb1pNFotln4FSovWqVmQ4zVJziB7YL7ud
 qbQuZUnNmFRJ9JihqPPmac6P8IJlUQYRsbropXy/E3Gj46WGMlHBRnrbfnmNU1vvPdDL
 2D588XVnXMQzjZ3cLfKU2IGAUXqWQeRa7kkVzeVLPuIKM/JYgNWIAdd2HzAC7hpjdnl+
 S1t2d5mc+plJSYzkRzVN4ZbGaa2XYJhsAgCXQ1kwFuxylyRQLz4qV36fazKo6jSwLujs
 t5sQ==
X-Gm-Message-State: AJIora965Dft/Z1j8HrnH2D4QTaMo82Dm3TgQCjJQQ9jcNhGvCQbE4aQ
 WxIIsu5oBhYmQq5WGlNWl7GE0E6IubSi6T6ssGBlgmystU8SCcVDd5O2nSWJsVEL5iJ+c3JJViv
 iaC+yTpkbFGMmoO7TDagHJpiAf87P
X-Received: by 2002:a05:620a:ccf:b0:6a7:3f06:7382 with SMTP id
 b15-20020a05620a0ccf00b006a73f067382mr20369575qkj.510.1655836906460; 
 Tue, 21 Jun 2022 11:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQtyzjeNUiEFaALb2+Pwnqzsqj/fE7B7hiW0p1G1YAsvHkK2gNLGtLJRnX+jR03duNRE64Kw==
X-Received: by 2002:a05:620a:ccf:b0:6a7:3f06:7382 with SMTP id
 b15-20020a05620a0ccf00b006a73f067382mr20369561qkj.510.1655836906184; 
 Tue, 21 Jun 2022 11:41:46 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 br6-20020a05620a460600b006a6d3fa430csm14344112qkb.58.2022.06.21.11.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 11:41:45 -0700 (PDT)
Message-ID: <0c7bcd24e85c8c5d3238ea2ebcb224b71b0da737.camel@redhat.com>
Subject: Re: [PATCH] drm/display: drop unexpected word "the" in the comments
From: Lyude Paul <lyude@redhat.com>
To: =?UTF-8?Q?=E8=92=8B=E5=81=A5?= <jiangjian@cdjrlc.com>, airlied
 <airlied@linux.ie>, daniel <daniel@ffwll.ch>
Date: Tue, 21 Jun 2022 14:41:44 -0400
In-Reply-To: <tencent_3192E0C14CE9003635C66293@qq.com>
References: <20220621131440.1512-1-jiangjian@cdjrlc.com>
 <4e772a9219177f548378ecac62e03be6c9928ead.camel@redhat.com>
 <026999e88cabd9bd4923e3c14271a94f5d264fa3.camel@redhat.com>
 <tencent_3192E0C14CE9003635C66293@qq.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-DyBv0vGJOwHTrwq7boM4"
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

--=-DyBv0vGJOwHTrwq7boM4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

You can send it by adding email addresses to git send-email with the "--to
foo@bar.net" argument. If it doesn't come up on patchwork the second try don't
worry about it, I'll look and see if I can workaround it. TBH I'm not entirely
sure why it didn't show up in the first place

On Wed, 2022-06-22 at 02:38 +0800, 蒋健 wrote:
> I need resubmit a new patch,  how can i make sure dri-devel@  is
> explicitly？I got to:list by the script
>  name of get_maintainer.pl.
> Pls help me…
> 
> 
> 发自我的企业微信 
> 
> ----------Reply to Message----------
> On Wed,Jun 22,2022 2:07 AM Lyude Paul <lyude@redhat.com> wrote:
> Actually I hate to ask but could you resend this and the other patch that yo
> u
> sent and make sure that dri-devel@ is explicitly in the to: list? For some
> reason these patches don't seem to be coming up on patchwork
> 
> On Tue, 2022-06-21 at 13:54 -0400, Lyude Paul wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Will push to the appropriate branch in a moment
> > 
> > On Tue, 2022-06-21 at 21:14 +0800, Jiang Jian wrote:
> > > there is an unexpected word "the" in the comments that need to be droppe
> d
> > > 
> > > file: drivers/gpu/drm/display/drm_dp_helper.c
> > > line: 1600
> > >   * Doesn't account the the "MOT" bit, and instead assumes each
> > > changed to
> > >   * Doesn't account the "MOT" bit, and instead assumes each
> > > 
> > > Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index e7c22c2ca90c..499f75768523 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct
> > > drm_dp_aux_msg *msg)
> > >   * Calculate the length of the i2c transfer in usec, assuming
> > >   * the i2c bus speed is as specified. Gives the the "worst"
> > >   * case estimate, ie. successful while as long as possible.
> > > - * Doesn't account the the "MOT" bit, and instead assumes each
> > > + * Doesn't account the "MOT" bit, and instead assumes each
> > >   * message includes a START, ADDRESS and STOP. Neither does it
> > >   * account for additional random variables such as clock stretching.
> > >   */
> > 
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 

-- 
Cheers,
Lyude Paul (she/her)
Software Engineer at Red Hat

--=-DyBv0vGJOwHTrwq7boM4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>You can send it by adding email addresses to =
git send-email with the "--to <a href=3D"mailto:foo@bar.net">foo@bar.net</a=
>" argument. If it doesn't come up on patchwork the second try don't worry =
about it, I'll look and see if I can workaround it. TBH I'm not entirely su=
re why it didn't show up in the first place</div><div><br></div><div>On Wed=
, 2022-06-22 at 02:38 +0800, =E8=92=8B=E5=81=A5 wrote:</div><blockquote typ=
e=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddin=
g-left:1ex"><div style=3D"min-height:22px;">I need resubmit a new patch, &n=
bsp;how can i make sure dri-devel@ &nbsp;is explicitly=EF=BC=9FI got to:lis=
t by the script</div><div style=3D"min-height:22px;">&nbsp;name of get_main=
tainer.pl.</div><div style=3D"min-height:22px;">Pls help me=E2=80=A6</div><=
div id=3D"QQMailSignature" class=3D"mail-footer" aria-hidden=3D"true"><hr s=
tyle=3D"margin: 0 0 10px 0;border: 0;border-bottom:1px solid #E6E8EB;height=
:0;line-height:0;font-size:0;padding: 20px 0 0 0;width: 40px;"><div style=
=3D"color:black;"><span><a contenteditable=3D"false" href=3D"https://work.w=
eixin.qq.com/wework_admin/user/h5/qqmail_user_card/vc725f487c45791b9d" styl=
e=3D"text-decoration: none;color: #267EF0;">=E5=8F=91=E8=87=AA=E6=88=91=E7=
=9A=84=E4=BC=81=E4=B8=9A=E5=BE=AE=E4=BF=A1</a>&nbsp;</span></div></div><div=
><br></div><div id=3D"original-content"><div class=3D"mailplugin_quote"><di=
v class=3D"mailplugin_quote_type" style=3D"height: 0px; color: rgba(0, 0, 0=
, 0); display: none;">----------Reply to Message----------</div><div class=
=3D"mailplugin_quote_header" style=3D"color: rgba(11, 17, 26, 0.6); font-fa=
mily: PingFang SC; font-style: normal; font-weight: normal; font-size: 14px=
; line-height: 150%;">On Wed,Jun 22,2022 2:07 AM Lyude Paul &lt;lyude@redha=
t.com&gt; wrote:</div><div class=3D"mailplugin_quote_split" style=3D"border=
-left: 3px solid #EAEAEA; padding-left: 9.5px; margin-top: 12px;"> Actually=
&nbsp;I&nbsp;hate&nbsp;to&nbsp;ask&nbsp;but&nbsp;could&nbsp;you&nbsp;resend=
&nbsp;this&nbsp;and&nbsp;the&nbsp;other&nbsp;patch&nbsp;that&nbsp;you<br>se=
nt&nbsp;and&nbsp;make&nbsp;sure&nbsp;that&nbsp;dri-devel@&nbsp;is&nbsp;expl=
icitly&nbsp;in&nbsp;the&nbsp;to:&nbsp;list?&nbsp;For&nbsp;some<br>reason&nb=
sp;these&nbsp;patches&nbsp;don't&nbsp;seem&nbsp;to&nbsp;be&nbsp;coming&nbsp=
;up&nbsp;on&nbsp;patchwork<br><br>On&nbsp;Tue,&nbsp;2022-06-21&nbsp;at&nbsp=
;13:54&nbsp;-0400,&nbsp;Lyude&nbsp;Paul&nbsp;wrote:<br>&gt;&nbsp;Reviewed-b=
y:&nbsp;Lyude&nbsp;Paul&nbsp;&lt;lyude@redhat.com&gt;<br>&gt;&nbsp;<br>&gt;=
&nbsp;Will&nbsp;push&nbsp;to&nbsp;the&nbsp;appropriate&nbsp;branch&nbsp;in&=
nbsp;a&nbsp;moment<br>&gt;&nbsp;<br>&gt;&nbsp;On&nbsp;Tue,&nbsp;2022-06-21&=
nbsp;at&nbsp;21:14&nbsp;+0800,&nbsp;Jiang&nbsp;Jian&nbsp;wrote:<br>&gt;&nbs=
p;&gt;&nbsp;there&nbsp;is&nbsp;an&nbsp;unexpected&nbsp;word&nbsp;"the"&nbsp=
;in&nbsp;the&nbsp;comments&nbsp;that&nbsp;need&nbsp;to&nbsp;be&nbsp;dropped=
<br>&gt;&nbsp;&gt;&nbsp;<br>&gt;&nbsp;&gt;&nbsp;file:&nbsp;drivers/gpu/drm/=
display/drm_dp_helper.c<br>&gt;&nbsp;&gt;&nbsp;line:&nbsp;1600<br>&gt;&nbsp=
;&gt;&nbsp;&nbsp;&nbsp;*&nbsp;Doesn't&nbsp;account&nbsp;the&nbsp;the&nbsp;"=
MOT"&nbsp;bit,&nbsp;and&nbsp;instead&nbsp;assumes&nbsp;each<br>&gt;&nbsp;&g=
t;&nbsp;changed&nbsp;to<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;*&nbsp;Doesn't&n=
bsp;account&nbsp;the&nbsp;"MOT"&nbsp;bit,&nbsp;and&nbsp;instead&nbsp;assume=
s&nbsp;each<br>&gt;&nbsp;&gt;&nbsp;<br>&gt;&nbsp;&gt;&nbsp;Signed-off-by:&n=
bsp;Jiang&nbsp;Jian&nbsp;&lt;jiangjian@cdjrlc.com&gt;<br>&gt;&nbsp;&gt;&nbs=
p;---<br>&gt;&nbsp;&gt;&nbsp;&nbsp;drivers/gpu/drm/display/drm_dp_helper.c&=
nbsp;|&nbsp;2&nbsp;+-<br>&gt;&nbsp;&gt;&nbsp;&nbsp;1&nbsp;file&nbsp;changed=
,&nbsp;1&nbsp;insertion(+),&nbsp;1&nbsp;deletion(-)<br>&gt;&nbsp;&gt;&nbsp;=
<br>&gt;&nbsp;&gt;&nbsp;diff&nbsp;--git&nbsp;a/drivers/gpu/drm/display/drm_=
dp_helper.c<br>&gt;&nbsp;&gt;&nbsp;b/drivers/gpu/drm/display/drm_dp_helper.=
c<br>&gt;&nbsp;&gt;&nbsp;index&nbsp;e7c22c2ca90c..499f75768523&nbsp;100644<=
br>&gt;&nbsp;&gt;&nbsp;---&nbsp;a/drivers/gpu/drm/display/drm_dp_helper.c<b=
r>&gt;&nbsp;&gt;&nbsp;+++&nbsp;b/drivers/gpu/drm/display/drm_dp_helper.c<br=
>&gt;&nbsp;&gt;&nbsp;@@&nbsp;-1597,7&nbsp;+1597,7&nbsp;@@&nbsp;static&nbsp;=
int&nbsp;drm_dp_aux_reply_duration(const&nbsp;struct<br>&gt;&nbsp;&gt;&nbsp=
;drm_dp_aux_msg&nbsp;*msg)<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;*&nbsp;Calcul=
ate&nbsp;the&nbsp;length&nbsp;of&nbsp;the&nbsp;i2c&nbsp;transfer&nbsp;in&nb=
sp;usec,&nbsp;assuming<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;*&nbsp;the&nbsp;i=
2c&nbsp;bus&nbsp;speed&nbsp;is&nbsp;as&nbsp;specified.&nbsp;Gives&nbsp;the&=
nbsp;the&nbsp;"worst"<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;*&nbsp;case&nbsp;e=
stimate,&nbsp;ie.&nbsp;successful&nbsp;while&nbsp;as&nbsp;long&nbsp;as&nbsp=
;possible.<br>&gt;&nbsp;&gt;&nbsp;-&nbsp;*&nbsp;Doesn't&nbsp;account&nbsp;t=
he&nbsp;the&nbsp;"MOT"&nbsp;bit,&nbsp;and&nbsp;instead&nbsp;assumes&nbsp;ea=
ch<br>&gt;&nbsp;&gt;&nbsp;+&nbsp;*&nbsp;Doesn't&nbsp;account&nbsp;the&nbsp;=
"MOT"&nbsp;bit,&nbsp;and&nbsp;instead&nbsp;assumes&nbsp;each<br>&gt;&nbsp;&=
gt;&nbsp;&nbsp;&nbsp;*&nbsp;message&nbsp;includes&nbsp;a&nbsp;START,&nbsp;A=
DDRESS&nbsp;and&nbsp;STOP.&nbsp;Neither&nbsp;does&nbsp;it<br>&gt;&nbsp;&gt;=
&nbsp;&nbsp;&nbsp;*&nbsp;account&nbsp;for&nbsp;additional&nbsp;random&nbsp;=
variables&nbsp;such&nbsp;as&nbsp;clock&nbsp;stretching.<br>&gt;&nbsp;&gt;&n=
bsp;&nbsp;&nbsp;*/<br>&gt;&nbsp;<br><br>--&nbsp;<br>Cheers,<br>&nbsp;Lyude&=
nbsp;Paul&nbsp;(she/her)<br>&nbsp;Software&nbsp;Engineer&nbsp;at&nbsp;Red&n=
bsp;Hat<br><br></div></div></div></blockquote><div><br></div><div><span><pr=
e>-- <br></pre><div data-evo-paragraph=3D"" class=3D"" style=3D"width: 78ch=
;" data-evo-signature-plain-text-mode=3D"">Cheers,</div><div data-evo-parag=
raph=3D"" class=3D"" style=3D"width: 78ch;"><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">=09</span>Lyude Paul (she/her)</div><div data-evo=
-paragraph=3D"" class=3D"" style=3D"width: 78ch;"><span class=3D"Apple-tab-=
span" style=3D"white-space:pre">=09</span>Software Engineer at Red Hat</div=
></span></div></body></html>

--=-DyBv0vGJOwHTrwq7boM4--

