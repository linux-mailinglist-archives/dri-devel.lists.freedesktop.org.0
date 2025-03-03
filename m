Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63049A4B7C2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 06:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9A10E110;
	Mon,  3 Mar 2025 05:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I4f0aIon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85510E110
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 05:57:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so4199724e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 21:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740981426; x=1741586226; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HWBERfZwdl/ZLDNsSZCDejFbWH27yw+tz7Ij819/Y+c=;
 b=I4f0aIon05wjt9eZKTUiNrvXwr33zhhy/tlz7yXCEBw5h0oJUE+b24lOZeJk9Q5AIz
 nn/+88meBkTI1AVwe+1YxTZtEZDjPHo7+aEJKVbFoPBqLV0sCwg/Ts1oGfxw6ibFzWLy
 R2MtnlB4AtXXC0v4eeMnUzEl+w/c2utnQoakSTIDgntwKnQfKOvPynDEuPQAPVpqgNsC
 PtYhDWuNEPdJWtOorxLRPJl6ZywSyI5fZRS3EpumTIh5rKxugjzxlbJ558yKnwSHYCSD
 /XmxJFuAkxhbNaBFIYGAjfymy+8xsV2jh1yZzod0LKF84w5HPeEpMmnzLvCXyK+N5L6H
 eJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740981426; x=1741586226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWBERfZwdl/ZLDNsSZCDejFbWH27yw+tz7Ij819/Y+c=;
 b=lzx6l0qNb5oTZ8qLoAweM9Do3jgdkJYqbrJky3Wqmu/njppkGNeMK1n5gZK0tKO84U
 a8CHC4V2nPJDGlYlVwIZMReaXo+jpMfyeN7kT2PQd3LygYTm/vuckrwtl+tj6TG8AmAg
 Lqpf5JoDxG2o5PJXlexh2alqIz+ao3Eosowa938VN1pl25EGEO7/xkNeNPihSVEjs0i3
 crtnopOSq4hUCdFM74Zy6sb7bNgHNlCcJ+B8LwX9ugONEi32JvJiV+d53MmsQ/VZhYA/
 /c7XYbHhhnyVVq9pDd86wpZMA3LayskdBxBMJGy786o5DqCU+UJHANvgTxGJtZseDGDc
 11xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGeKPziRoT+2eoOb8TllQUX+Ig3pUx7C2gAReITSOOIdr575TVH5vopFxsVisqEMqS6Amak1DWyvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5N3dRHlmFMlGHo+JsebYL0fwnOh7mnvGXDgdWHs0u0GVbGD3J
 QwkCLTo7It9K0ld9bQ+1CPuLtTX58JvdMjBN029pJ7SJYcYCUfGKXHKp/C2pevw=
X-Gm-Gg: ASbGncu+RtakYmKyJD7PWGNIann0M20/ULsgUm5Ulm8fZ69Zc7GvfSvHKiK61rubo/6
 hSsKNX5dgaspsyo+JMJK3LpLtMwh5EqRZbObyaNXzw3S/vC7R0o/mgCZ65Mo65O2xFSV1RitrHS
 R8L1Y2TtRq/BykVtM+f10cPNPXo9lGZB148CrSayhs2eFMHpML/Odb9wgk/Fxt/cMew3ADbYaKb
 djwzZkdXYszQk/NPwSfaX/NAJoN4n/IWG0cBCUZyb+p/UCuk/nANErSdWrS6F+YlBb5iFKdbH0w
 ftBvTXmN+17trEr+05sY03CWOOZsPYroh9nCi85SxWu+9Dtw0SsR6N3zuVyEr6Vs2dPBET4LtFc
 lfirZH+27EJo5nxW9sxvY1ZO9
X-Google-Smtp-Source: AGHT+IGIC/s5MUT4pFlpat5x0cb77+1fbUQt3ZrQqYTEYQAarXWRgBC0UpZ1rzDKYIgWH6QxoU9hgg==
X-Received: by 2002:a05:6512:a8b:b0:545:8c8:30f2 with SMTP id
 2adb3069b0e04-5494c107d86mr4882774e87.1.1740981426320; 
 Sun, 02 Mar 2025 21:57:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495f27fd5fsm438707e87.255.2025.03.02.21.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 21:57:04 -0800 (PST)
Date: Mon, 3 Mar 2025 07:57:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <zzi2h52xiernm32h7i7xtrlnjwaqc3n2tx33ypmhw6quoi5qyg@pilzj5zantii>
References: <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
 <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
 <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
 <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
 <4hicem4rbz5l7wnzaaz3krrl3euh2dmvlah2rb7errrdq5fann@44dvdxirkuzh>
 <6506e448-3851-436f-9354-42f9ef844d27@huawei.com>
 <njnz5hxumrvqrgsfq7zlunle3jgfan3be34ao5xtkmzczpi6af@waywds2ww6qw>
 <c87613aa-1d17-4a88-acce-269ea9eddc22@huawei.com>
 <CAA8EJpo71m_ae9siT7f4Tsfr0C4XeoraqPYPsPp0gz-N+oMOjw@mail.gmail.com>
 <6e54c88f-dfaf-462d-b66b-c237d19faec6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e54c88f-dfaf-462d-b66b-c237d19faec6@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 03, 2025 at 01:02:44PM +0800, Yongbang Shi wrote:
> 
> > On Sat, 1 Mar 2025 at 11:54, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > 
> > > > On Sat, Mar 01, 2025 at 04:45:40PM +0800, Yongbang Shi wrote:
> > > > > > On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
> > > > > > > > On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> > > > > > > > > > On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > > > > > > > On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> > > > > > > > > > > > > > > +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> > > > > > > > > > > > > > > +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> > > > > > > > > > > > > > > +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> > > > > > > > > > > > > > > +  int ret;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +  if (dp->hpd_status) {
> > > > > > > > > > > > > > > +          hibmc_dp_hpd_cfg(&priv->dp);
> > > > > > > > > > > > > > > +          ret = hibmc_dp_prepare(dp, mode);
> > > > > > > > > > > > > > > +          if (ret)
> > > > > > > > > > > > > > > +                  return ret;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +          hibmc_dp_display_en(dp, true);
> > > > > > > > > > > > > > > +  } else {
> > > > > > > > > > > > > > > +          hibmc_dp_display_en(dp, false);
> > > > > > > > > > > > > > > +          hibmc_dp_reset_link(&priv->dp);
> > > > > > > > > > > > > > > +  }
> > > > > > > > > > > > > > If I understand this correctly, you are using a separate drm_client to
> > > > > > > > > > > > > > enable and disable the link & display. Why is it necessary? Existing
> > > > > > > > > > > > > > drm_clients and userspace compositors use drm framework, they should be
> > > > > > > > > > > > > > able to turn the display on and off as required.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> > > > > > > > > > > > > We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> > > > > > > > > > > > > the different video modes into DP registers.
> > > > > > > > > > > > Why? The link training and mode programming should happen during
> > > > > > > > > > > > pre_enable / enable stage (legacy or atomic).
> > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > 
> > > > > > > > > > > Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> > > > > > > > > > > And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> > > > > > > > > > It should be userspace, who triggers the enable/disable (or it should
> > > > > > > > > > be the in-kernel fbdev / fbcon, which interface through the generic
> > > > > > > > > > drm_fbdev client).
> > > > > > > > > Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> > > > > > > > > by user, but it won't call when HPD triggered .
> > > > > > > > - Is HPD even properly delivered to userspace? What kind of compsitor
> > > > > > > >       are you using? Is .detect working properly and reporting a correct
> > > > > > > >       plug-in state?
> > > > > > > Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
> > > > > > > this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
> > > > > > > I use Xorg, and the display service is GDM.
> > > > > > > The .detect is called and the getting modes info is correct.
> > > > > > > I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.
> > > > > > You can go to the display settings in GDM. It would be interesting to
> > > > > > observe if it notes the second monitor or not. Last, but not least, you
> > > > > > can use a simple tool like 'xrandr' under your XOrg session to set the
> > > > > > display resolution.
> > > > > Thank you for your advice!
> > > > > Right, there are DP and VGA two monitors. I tried to totally remove the vga connector in driver, the problem is gone.
> > > > > So do I need to clear the vga connector, if dp is plugged in?
> > > > Unless your hardware can not manage two outputs at the same time, no,
> > > > you don't have to. Just check how it behaves on x86 systems. Ideally
> > > > your driver should have the same behaviour.
> > > Our hardware cannot support two outputs with different timing, so I used the one crtc and one plane that DP and VGA share. And just add a new DP connector
> > > with a encoder, just like the previous VGA's code logic. But the HPD problem makes me feel confused, should I change the framwork structure to slove this problem?
> > I think registering a single CRTC is a correct way. Then it is logical
> > that there is no mode set on the DP when you connect it. The userspace
> > can not output any data. However if you disconnect VGA and connect DP
> > then it should become active and should output your desktop
> > environment.
> 
> Okay, Thank you for your guidance. So I need to disconnect VGA when I get the HPD (plugged in) , then
> userapce will active and enanble DP, right?

Yes.

> 
> 
> > > And also, I will check whether this driver works good on the x86 server. Right now, I'm testing on arm64 server.
> > > 
> > > > > And also, I used xrandr to set modes after 'startx'. Changing resolutions works,
> > > > > but there are errs when set some low resolutions.
> > > > That's a separate topic, most likely related to timing or to some other
> > > > issues. You can fix that separately (but please do, switching modes
> > > > should work).
> > > Okay!
> > > 
> > > 
> > 

-- 
With best wishes
Dmitry
