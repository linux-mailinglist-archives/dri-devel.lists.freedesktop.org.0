Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD1536C3E
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 12:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690210F375;
	Sat, 28 May 2022 10:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F81010F375
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 10:08:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h5so626434wrb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+ld2qp0qk5nXcYqBUMPdBbYoV5PQ+Ec1SRfmrADsZqo=;
 b=aCwSqd9Klz71oU62cK3Hou0JutUcuA0XlTeD12lNZNtex7w7vIaWDeC8XBl292UfmE
 lNiLmHU9ZRT0PCwpBeBc/+quSVrd/PpqnNrJ0uvRY6JbH1WHBPXRfIR9Xge8QGcfxONA
 s/IzBkMKJ0+UzcoF8RM2HuyqBg7l13/DVI6sDJcDBiL83ofxpJ1VoQ7k/4SqoHC5Ft+6
 Qy+Ly7xE4s7wCWTM105qTQnVdaWhFH8dW1PLHw4EtYQXR2Q3jKolUWwYULVDjbc6tpuZ
 +62q3vyYhPgFRg7hinh8wvpJEBeYnw+P27Wbsflq8D6qvz/V8SKuQqH9Xztsi51PcSpM
 CzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ld2qp0qk5nXcYqBUMPdBbYoV5PQ+Ec1SRfmrADsZqo=;
 b=5+dAhl45AQraMqcrO+ogdppgEGVBLJM7gdeNcDSv8k2yhomfrq5dMFqLNAXgTpwT0N
 L0sBSYfcRLB4EZXShuvekm8T3Nd21PEboArEb6oOAfZ3CMxvqpeaEdnxhR22eGML9Bq0
 k29Nqp36DRwg2/51y9F6MpA+JWHzB8Y1rFR7fN5+OR4Mpm5N4OnIRFMTjgf0mfzjK/Yd
 TYnLNHyxXa2/yJ4UoHzsXei3lQ/BxsGtZC62udXBHYiLYHbFaxKQyuUTJjzwr2ECf0tR
 xeMpYvvp0MjUFtcKmn4ovfOoPA9FytGaQ9tjA/Xqtr46BHkFf3IoFaOfIaBqAJ/r3oit
 wV/w==
X-Gm-Message-State: AOAM532xGW4MFIp6ymm7BDgjdzQT9/qURk7rVHCFysr/UAh4nPn08Sgt
 d7PuihLbFTTz8ofMI2rPWcE=
X-Google-Smtp-Source: ABdhPJxOB6yFEiXhzFOOjFz046H9QL3g3S+5T05O9gwDyfPHjShlEzJ0SzLSElgPFRh5szncHmDj7A==
X-Received: by 2002:adf:fb4c:0:b0:20f:d4e7:b84f with SMTP id
 c12-20020adffb4c000000b0020fd4e7b84fmr25264715wrs.406.1653732482611; 
 Sat, 28 May 2022 03:08:02 -0700 (PDT)
Received: from debian (host-2-98-37-191.as13285.net. [2.98.37.191])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d4b01000000b0020d0435c97bsm3816915wrq.92.2022.05.28.03.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 03:08:02 -0700 (PDT)
Date: Sat, 28 May 2022 11:07:59 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Message-ID: <YpH0f4BaWxmlxwYp@debian>
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7fp69rSQSZSnEaKc"
Content-Disposition: inline
In-Reply-To: <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7fp69rSQSZSnEaKc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

On Fri, May 27, 2022 at 06:04:14PM -0700, Linus Torvalds wrote:
> On Fri, May 27, 2022 at 4:41 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > I just tested with various values, sizeof(*edid) is 144 bytes at that place.
> 
> Hmm. What compiler do you have? Because it seems very broken.

I am using gcc version 11.3.1 20220517 (GCC). And I am not just building
spear3xx_defconfig, I am building all the arm configs with the same
compiler in the same setup and only spear3xx_defconfig started failing.
I am attaching a build summary report generated on 26th May, all arm builds
passed, even allmodconfig.

> 

<snip>

> 
> But it obviously doesn't happen for me or for most other people, so
> it's something in your setup. Unusual compiler?

And, just to verify its not my setup or the compiler I use, I took a fresh
Debian Bullseye docker, installed 'gcc-arm-linux-gnueabi' from Debian and I see
the same build failure with spear3xx_defconfig. This gcc from Debian Bullseye
is: gcc version 10.2.1 20210110 (Debian 10.2.1-6).


--
Regards
Sudip

--7fp69rSQSZSnEaKc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="report_babf0bb978e3.log"

HEAD -> babf0bb978e3 ("Merge tag 'xfs-5.19-for-linus' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux")

allmodconfig -> pass
am200epdkit_defconfig -> pass
aspeed_g4_defconfig -> pass
aspeed_g5_defconfig -> pass
assabet_defconfig -> pass
at91_dt_defconfig -> pass
axm55xx_defconfig -> pass
badge4_defconfig -> pass
bcm2835_defconfig -> pass
cerfcube_defconfig -> pass
clps711x_defconfig -> pass
cm_x300_defconfig -> pass
cns3420vb_defconfig -> pass
colibri_pxa270_defconfig -> pass
colibri_pxa300_defconfig -> pass
collie_defconfig -> pass
corgi_defconfig -> pass
davinci_all_defconfig -> pass
dove_defconfig -> pass
ep93xx_defconfig -> pass
eseries_pxa_defconfig -> pass
exynos_defconfig -> pass
ezx_defconfig -> pass
footbridge_defconfig -> pass
gemini_defconfig -> pass
h3600_defconfig -> pass
h5000_defconfig -> pass
hackkit_defconfig -> pass
hisi_defconfig -> pass
imx_v4_v5_defconfig -> pass
imx_v6_v7_defconfig -> pass
imxrt_defconfig -> pass
integrator_defconfig -> pass
iop32x_defconfig -> pass
ixp4xx_defconfig -> pass
jornada720_defconfig -> pass
keystone_defconfig -> pass
lart_defconfig -> pass
lpc18xx_defconfig -> pass
lpc32xx_defconfig -> pass
lpd270_defconfig -> pass
lubbock_defconfig -> pass
magician_defconfig -> pass
mainstone_defconfig -> pass
milbeaut_m10v_defconfig -> pass
mini2440_defconfig -> pass
mmp2_defconfig -> pass
moxart_defconfig -> pass
mps2_defconfig -> pass
multi_v4t_defconfig -> pass
multi_v5_defconfig -> pass
multi_v7_defconfig -> pass
mv78xx0_defconfig -> pass
mvebu_v5_defconfig -> pass
mvebu_v7_defconfig -> pass
mxs_defconfig -> pass
neponset_defconfig -> pass
netwinder_defconfig -> pass
nhk8815_defconfig -> pass
omap1_defconfig -> pass
omap2plus_defconfig -> pass
orion5x_defconfig -> pass
oxnas_v6_defconfig -> pass
palmz72_defconfig -> pass
pcm027_defconfig -> pass
pleb_defconfig -> pass
pxa168_defconfig -> pass
pxa255-idp_defconfig -> pass
pxa3xx_defconfig -> pass
pxa910_defconfig -> pass
pxa_defconfig -> pass
qcom_defconfig -> pass
realview_defconfig -> pass
rpc_defconfig -> pass
s3c2410_defconfig -> pass
s3c6400_defconfig -> pass
s5pv210_defconfig -> pass
sama5_defconfig -> pass
sama7_defconfig -> pass
shannon_defconfig -> pass
shmobile_defconfig -> pass
simpad_defconfig -> pass
socfpga_defconfig -> pass
spear13xx_defconfig -> pass
spear3xx_defconfig -> failed
spear6xx_defconfig -> pass
spitz_defconfig -> pass
stm32_defconfig -> pass
sunxi_defconfig -> pass
tct_hammer_defconfig -> pass
tegra_defconfig -> pass
trizeps4_defconfig -> pass
u8500_defconfig -> pass
versatile_defconfig -> pass
vexpress_defconfig -> pass
vf610m4_defconfig -> pass
viper_defconfig -> pass
vt8500_v6_v7_defconfig -> pass
xcep_defconfig -> pass
zeus_defconfig -> pass

--7fp69rSQSZSnEaKc--
