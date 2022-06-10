Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C054608A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E79D10E799;
	Fri, 10 Jun 2022 08:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95511272C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 08:54:17 +0000 (UTC)
Date: Fri, 10 Jun 2022 08:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654851255; x=1655110455;
 bh=Ay3vNldDYeXoH6RuVdHIVV78Y6TGsyO0i919h6PwFS8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=rYocdbt9FxwXriRbOwaMBgVloXVaNdt7yCwTZ/ew2S2MeyXlysD3+GGekcfGDcVs0
 6d+m8kb+djn9Kbr3EQvF0QTIqYkLCOm9MdE8zcXIhS4tAdJQBTShP6hPnKM2iLj/OW
 Mb2vqws8RZv+STL2a02eydW/0f++qafcJU8oVsLDByqn3CUOL/7dZJZAOJ0lKnRSLp
 lLaB4yax0YfGEzp6ZHHMnYhq74HFkn+tccEgNAzaqnDtPz2IysYAC6ExiJDB+Pyypy
 /DF0Am8ClZlQqTGAtn7hkfNrs8xlDD692OMDhKU1RUEnQFMGMg5hndf23a/lwKbbMM
 7xvalaTXG1tRQ==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <4CJ-x-v-p82cgfBong1zaXjiyI_CnIyh2mOHdGEDi8dpNgr-M4cagtnxFnFCipfM9OjcoM9ZtWtaHKglAzjDzP8169AKwGqGMVT042UhHXk=@emersion.fr>
In-Reply-To: <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
 <20220608105338.22592a09@eldfell>
 <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I agree with what others have replied, just adding a few more details.

On Thursday, June 9th, 2022 at 21:39, Zack Rusin <zackr@vmware.com> wrote:

> virtualized drivers send drm_kms_helper_hotplug_event which sends a HOTPL=
UG=3D1
> event with a changed preferred width/height

(Note: and the "hotplug_mode_update" property is set to 1.)

> suggested_x and suggested_y properties

These come with their own set of issues. They are poorly defined, but it se=
ems
like they describe a position in physical pixel coordinates. Compositors do=
n't
use physical pixel coordinates to organize their outputs, instead they use
logical coordinates. For instance, a HiDPI 4k screen with a scale of 2 will
take up 1920x1080 logical pixels. There is no way to convert physical pixel
coordinates to logical pixel coordinates in the general case, because there=
's
no "global scale factor". So suggested_x/y are incompatible with the way
compositors work.
