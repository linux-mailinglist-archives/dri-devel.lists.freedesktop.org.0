Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964E438F60
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 08:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D453989DBF;
	Mon, 25 Oct 2021 06:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4F389D9A;
 Mon, 25 Oct 2021 06:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1635113882; bh=uw6jUOdznN5Fu1cmQxsbGLSaS5P2w7SplYgPex568YQ=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=kpn3YOQUKeK9qDpnf0StFTwdc4WJreIl9JR8oi4rUbw2RZC0IEtUV7NQk5CjR3JWj
 AEBLg5lA/FkJuQmNxIv/k09YqvRAHZmzYfR2B2Hv/gSnP/O9JktEiJjGBVqLmzKzGR
 /BmdwJXbj2xTfAUE0fjrTjyaO9MnP/V/8Ufrnq/A=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 25 Oct 2021 00:17:45 +0200 (CEST)
X-EA-Auth: tM23DGE6RIEgIBepFFyFZ3U+VcDqeb1NZ+9uNCAhSimMRHbJIRvea/6qSymDwthzabP0gvaNwIR0mJ56UkO3tKDYzFIv2ik3
Date: Mon, 25 Oct 2021 00:17:37 +0200
From: Claudio Suarez <cssk@net-c.es>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
Subject: Re: [Intel-gfx] [PATCH v3 13/13] drm/i915: replace
 drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Message-ID: <YXXbgWNHts9CMJXD@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es> <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain> <YXFwB7rN4bvR0Z+m@intel.com>
 <YXKRnUHWuboQKBF1@zorro.micasa> <YXKoMEF/gU98cL9n@intel.com>
 <YXKtIUDk+f2Bnn++@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXKtIUDk+f2Bnn++@intel.com>
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

On Fri, Oct 22, 2021 at 03:22:57PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 22, 2021 at 03:01:52PM +0300, Ville Syrjälä wrote:
> > On Fri, Oct 22, 2021 at 12:25:33PM +0200, Claudio Suarez wrote:
> > > On Thu, Oct 21, 2021 at 04:49:59PM +0300, Ville Syrjälä wrote:
> > > > On Wed, Oct 20, 2021 at 12:51:21AM +0200, Claudio Suarez wrote:
> > > > > drm_get_edid() internally calls to drm_connector_update_edid_property()
> > > > > and then drm_add_display_info(), which parses the EDID.
> > > > > This happens in the function intel_hdmi_set_edid() and
> > > > > intel_sdvo_tmds_sink_detect() (via intel_sdvo_get_edid()).
> > > > > 
> > > > > Once EDID is parsed, the monitor HDMI support information is available
> > > > > through drm_display_info.is_hdmi. Retriving the same information with
> > > > > drm_detect_hdmi_monitor() is less efficient. Change to
> > > > > drm_display_info.is_hdmi
> > > > 
> > > > I meant we need to examine all call chains that can lead to
> > > > .detect() to make sure all of them do in fact update the
> > > > display_info beforehand.
> > > 
> > > Well, I studied it carefully and, yes, all call chains that can lead to
> > > drm_display_info.is_hdmi / drm_detect_hdmi_monitor() update display_info
> > > beforehand. In the case that this doesn't happen, the code is unchanged.
> > > 
> > > Do you want I explain the changes in the code here again ? Or do you want
> > > to me change the commit message to be more clear ? In the first case, I can
> > > write here a detailed explanation. In the second case I can make a longer commit
> > > message.
> > > 
> > > Or both?
> > 
> > I want all those call chains explained in the commit message,
> > otherwise I have no easy way to confirm whether the change
> > is correct or not.
> 
> Hmm. OK, so I had a bit of a dig around and seems that what we do now
> .detect()->drm_get_edid()->drm_connector_update_edid_property()->drm_add_display_info()

Yes. I said before that I felt something was wrong when I read the
documentation and then the code. To be more explicit now, I expected that
drm_connector_update_edid_property() will be done in the
fill_modes/get_modes phase instead of when reading the edid.
The documentation suggests that but the code reads the edid in the
detect phase.
Now, since drm_connector_update_edid_property() is called in the detect
phase, it is not necessary to keep the edid data in the private connector
struct. It is in struct drm_connector from the beginning.
But this is topic for another patch.

> Now the question is when did that start happening? Looks like it was
> commit 4b4df570b41d ("drm: Update edid-derived drm_display_info fields
> at edid property set [v2]") that started to call drm_add_display_info()
> from drm_connector_update_edid_property(), and then commit 5186421cbfe2
> ("drm: Introduce epoch counter to drm_connector") started to call
> drm_connector_update_edid_property() from drm_get_edid(). Before both
> of those commits were in place display_info would still contain
> some stale garbage during .detect().
>
> That is the story I think we want in these commit messages since it
> a) explains why the old code was directly parsing the edid instead
> b) why it's now safe to change this

------------------commit-message?--------------------

drm/i915: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi

Commit a92d083d08b0 created the new flag is_hdmi in drm_display_info
which is set when sink compliant with CEA-861 (EDID) shall be treated
as an HDMI sink.

From that day, this value can be used in some cases instead of
calling drm_detect_hdmi_monitor() and a second parse is avoided
because drm_detect_hdmi_monitor() parses. A TODO task was
registered in Documentation/gpu/todo.rst to perform that task in
the future.

The flag drm_display_info.is_hdmi is set in the function
drm_add_display_info(), which is called from
drm_connector_update_edid_property(). Since commit 5186421cbfe2,
drm_get_edid() calls drm_connector_update_edid_property() when
reading the edid data from an i2c adapter. Therefore, in these
cases drm_display_info.is_hdmi is updated to its correct
value when returning from drm_get_edid().

Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
in the cases when drm_detect_hdmi_monitor() is called after a
read from an i2c adapter using drm_get_edid() in the i915 driver.
-----------------------------------------------

> 
> PS. connector->force handling in drm_get_edid() looks a bit busted
> since it doesn't call drm_connector_update_edid_property() at all
> in some cases. I think there might be some path that leads there
> anywya if/when we change connector->force, but we should fix
> drm_get_edid() to do the right thing regarless.

In those cases, the edid isn't read and NULL is returned by drm_get_edid().
No problem because display_info.is_hdmi is inside an if (edid != NULL).

BTW, struct intel_connector is allocated with kzalloc, so the initial
value of is_hdmi is zero. The connector isn't HDMI by default.

BR.
Claudio Suarez.


