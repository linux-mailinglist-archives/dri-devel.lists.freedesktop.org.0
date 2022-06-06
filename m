Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47653EE99
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E639210E8C4;
	Mon,  6 Jun 2022 19:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB10B10E8C4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=TgDihkH46ScClTSETfwqhaOdnc1k4sLTbZgl+nfhbY8=;
 b=FcYUSxOBeC3/3TSClpuNV4GNrV3iOrNNyrWN6NwR4YFpuOA9htQSBDA4jDlQACv62Jk5XCXFZmI6n
 iw+3JRfyWrgmSpK0I2zsukxj+p+bKHACwwusz5ZgrzvoREHTnjoVWRRmBc7wjUJ+jd6hXHoN3+n3U5
 PqSajIfSI09v29OJT37rk84N2nE+GSfy+S0CB6lBrqfGeEu8FIhkSO7B2FrC2+XrBond1oLjpVDpY5
 MFfYqNGcusKGHptchBiXHLYwV2nW9iLpaEZxe0h2QATkz3YJDF+lKxj33rXn4IQZWTkhOCry4UxMt/
 7Q745JTlZm/KCSwRPaXmJqQH5q6bf2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=TgDihkH46ScClTSETfwqhaOdnc1k4sLTbZgl+nfhbY8=;
 b=EEHshRn2hLMK6AbLweFjaENfWd0Dr3h7mvknN5bPcKlCRgP3UmSGxxVtmrTWx9TuGMlGISYw2A++M
 1q51q4VDg==
X-HalOne-Cookie: f9fa9657bbf05a6c012e61f3fb9ae7e606a7e2db
X-HalOne-ID: dfa5331a-e5ce-11ec-a911-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id dfa5331a-e5ce-11ec-a911-d0431ea8a290;
 Mon, 06 Jun 2022 19:28:42 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:28:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 0/8] Add a panel API to return panel orientation
Message-ID: <Yp5VaBd8slSSnQAs@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,
thanks for this nice series.

On Mon, Jun 06, 2022 at 11:24:23PM +0800, Hsin-Yi Wang wrote:
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
> 
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
> 
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so they
> can call drm_connector_set_panel_orientation() before drm_dev_register().
> 
> Panel needs to implement .get_orientation callback to return the property.

The following comment appears in every panel driver:
+       /*
+        * drm drivers are expected to call drm_panel_get_orientation() to get
+        * panel's orientation then drm_connector_set_panel_orientation() to
+        * set the property before drm_dev_register(). Otherwise there will be
+        * a WARN_ON if orientation is set after drm is registered.
+        */

Please move it to the drm_panel c or h file, it is noise to add it to
all panel drivers.

	Sam
