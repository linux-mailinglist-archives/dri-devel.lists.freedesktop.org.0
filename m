Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911B42FB5F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 20:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C616EDF9;
	Fri, 15 Oct 2021 18:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4266C6EDF1;
 Fri, 15 Oct 2021 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634323490; bh=GH6/gUCiShU+F5SqmxsR4+La/OM2Q/v8Xu77xbZRtEI=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=iS4Bu/dr4YsBsd4N3foSlzvu2+8B1KjImGHH0E7aCxLtA8G3qywnAvJtd24Fi/vQe
 gQWmJ7Dzs4IfVYLYObWC1Xc4gS8atxgQO6O2HEIOGUFHuwIS5iXfkeuEUx4usSreLp
 Qd/7etR7d+27siL13nnD/vntfKFtUGTvbHaB5anE=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 15 Oct 2021 20:44:50 +0200 (CEST)
X-EA-Auth: T0JFquBunFvgzGD4hDlMVaBd6t9O7J/bYpv2pxbJaZ0EDxqUCUY8D5LdZVbpM/ygJIFdRwSik6v8XCP0wRcT3NhVaxr9JWRH
Date: Fri, 15 Oct 2021 20:44:47 +0200
From: Claudio Suarez <cssk@net-c.es>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 15/15] drm/i915: replace
 drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Message-ID: <YWnMH/V1wRrAyYR9@gineta.localdomain>
References: <20211015113713.630119-1-cssk@net-c.es>
 <20211015113713.630119-16-cssk@net-c.es> <87a6jav4n3.fsf@intel.com>
 <YWl7D9Qnt/Ysk2JI@intel.com> <874k9iuxit.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874k9iuxit.fsf@intel.com>
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

On Fri, Oct 15, 2021 at 06:18:34PM +0300, Jani Nikula wrote:
> On Fri, 15 Oct 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Oct 15, 2021 at 03:44:48PM +0300, Jani Nikula wrote:
> >> On Fri, 15 Oct 2021, Claudio Suarez <cssk@net-c.es> wrote:
> >> > Once EDID is parsed, the monitor HDMI support information is available
> >> > through drm_display_info.is_hdmi. Retriving the same information with
> >> > drm_detect_hdmi_monitor() is less efficient. Change to
> >> > drm_display_info.is_hdmi where possible.
> >> >
> >> > This is a TODO task in Documentation/gpu/todo.rst
> >> >
> >> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_connector.c | 5 +++++
> >> >  drivers/gpu/drm/i915/display/intel_connector.h | 1 +
> >> >  drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
> >> >  drivers/gpu/drm/i915/display/intel_sdvo.c      | 3 ++-
> >> >  4 files changed, 9 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
> >> > index 9bed1ccecea0..3346b55df6e1 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_connector.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> >> > @@ -213,6 +213,11 @@ int intel_ddc_get_modes(struct drm_connector *connector,
> >> >  	return ret;
> >> >  }
> >> >  
> >> > +bool intel_connector_is_hdmi_monitor(struct drm_connector *connector)
> >> > +{
> >> > +	return connector->display_info.is_hdmi;
> >> > +}
> >> > +
> >> 
> >> A helper like this belongs in drm, not i915. Seems useful in other
> >> drivers too.
> >
> > Not sure it's actually helpful for i915. We end up having to root around
> > in the display_info in a lot of places anyway. So a helper for single
> > boolean seems a bit out of place perhaps.
> 
> *shrug*
> 
> Maybe it's just my frustration at the lack of interfaces and poking
> around in the depths of nested structs and pointer chasing that's coming
> through. You just need to change so many things if you want to later
> refactor where "is hdmi" comes from and is stored.
> 
> Anyway, if a helper is being added like in this series, I think it
> should be one helper in drm, not redundant copies in multiple
> drivers. Or we should not have the helper(s) at all. One or the other,
> not the worst of both worlds.

Thank you all for your comments :)
The big work here was to figure out which drm_detect_hdmi_monitor() can be
replaced. Changing a helper isn't a problem.
I'll send a new patch in a few hours.

BR
Claudio Suarez.



