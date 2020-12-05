Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1B2CFEFB
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 21:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6AE6E446;
	Sat,  5 Dec 2020 20:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9771A6E446
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 20:58:59 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 27823804D5;
 Sat,  5 Dec 2020 21:58:55 +0100 (CET)
Date: Sat, 5 Dec 2020 21:58:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 23/28] video: fbdev: omapfb: Fix set but not used
 warnings in hdmi*_core
Message-ID: <20201205205853.GA1045000@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-24-sam@ravnborg.org>
 <e6664921-cc89-6814-8d63-33f43df63ed4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6664921-cc89-6814-8d63-33f43df63ed4@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=i0EeH86SAAAA:8 a=KKAkSRfTAAAA:8
 a=_u4_8sTnNstuJUXPl18A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 11:06:15AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> > Fix a few W=1 warnings about unused assignments.
> > Drop the unused error code.
> > 
> > v2:
> >    - Subject updated (Lee)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Qilong Zhang <zhangqilong3@huawei.com>
> > Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > ---
> >   drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c | 4 ++--
> >   drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> > index 726c190862d4..e6363a420933 100644
> > --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> > +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> > @@ -679,7 +679,7 @@ int hdmi4_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
> >   	struct hdmi_audio_format audio_format;
> >   	struct hdmi_audio_dma audio_dma;
> >   	struct hdmi_core_audio_config acore;
> > -	int err, n, cts, channel_count;
> > +	int n, cts, channel_count;
> >   	unsigned int fs_nr;
> >   	bool word_length_16b = false;
> > @@ -741,7 +741,7 @@ int hdmi4_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
> >   		return -EINVAL;
> >   	}
> > -	err = hdmi_compute_acr(pclk, fs_nr, &n, &cts);
> > +	hdmi_compute_acr(pclk, fs_nr, &n, &cts);
> 
> I'd rather return the error reported by hdmi_compute_acr()

The DRM version of the same driver does not bother, so I think we should
avoid it here too.

The better fix would be to sunset the omapfb driver - dunno how far we
are from that. There is still a lot of patch chrunch on the omapdrm
driver.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
