Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842476C033A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6C10E00A;
	Sun, 19 Mar 2023 16:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6F410E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 16:42:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BAE25CE0F54;
 Sun, 19 Mar 2023 16:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADBEC433D2;
 Sun, 19 Mar 2023 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679244174;
 bh=m3sw+XMw5dhiv51zM8Qz+hZaNj1/M9NgJPRnsGEcfMI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ip9eElWgROXjI51RtuYe4l8KWQeEtlbGygArtNQjnrdrNcd0kP8gof5qDnbDGDvpW
 zM3p/K94E4mjaRiqHRD8n8PgOnAEQxW6o02esXSQO4lEU1aL8C4Ls8pqgh7kAbwiON
 D9I/2eyvFpXFbNgU48cji/75VAb/ZHaWq7iUvqRBQTdQV2KpHYcRIAcst/rJsYYnQ2
 2gMK/psN50XePqbkk0mk0xXy4B2jVEwxAQ+04UM7cavU0jLZocJ0GVbOfeR7OI4iYF
 eYqRpShmxefMK7Fqy0xYisPV2vbA4ROJaSFzLmvHj9wkWIWR/Rb+1mKWkgnc8m2mle
 xFyxd83qmONJA==
Date: Sun, 19 Mar 2023 16:57:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 0/8] Support ROHM BU27034 ALS sensor
Message-ID: <20230319165744.10e49cc0@jic23-huawei>
In-Reply-To: <cover.1679062529.git.mazziesaccount@gmail.com>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Mar 2023 16:40:16 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> Support ROHM BU27034 ALS sensor

Hi Matti,

For ease of when this is ready to apply, better to just keep
key mailing lists and individuals cc'd on all patches.

Mind you cc list is random enough I'm guessing it wasn't
deliberate (like the maintainers patch 8 only went to lkml
where no one will notice it)

I can scrape these all of lore, but it's a step that not
all reviewers are going to bother with.

Jonathan



> 
> This series adds support for ROHM BU27034 Ambient Light Sensor.
> 
> The BU27034 has configurable gain and measurement (integration) time
> settings. Both of these have inversely proportional relation to the
> sensor's intensity channel scale.
> 
> Many users only set the scale, which means that many drivers attempt to
> 'guess' the best gain+time combination to meet the scale. Usually this
> is the biggest integration time which allows setting the requested
> scale. Typically, increasing the integration time has better accuracy
> than increasing the gain, which often amplifies the noise as well as the
> real signal.
> 
> However, there may be cases where more responsive sensors are needed.
> So, in some cases the longest integration times may not be what the user
> prefers. The driver has no way of knowing this.
> 
> Hence, the approach taken by this series is to allow user to set both
> the scale and the integration time with following logic:
> 
> 1. When scale is set, the existing integration time is tried to be
>    maintained as a first priority.
>    1a) If the requested scale can't be met by current time, then also
>        other time + gain combinations are searched. If scale can be met
>        by some other integration time, then the new time may be applied.
>        If the time setting is common for all channels, then also other
>        channels must be able to maintain their scale with this new time
>        (by changing their gain). The new times are scanned in the order
>        of preference (typically the longest times first).
>    1b) If the requested scale can be met using current time, then only
>        the gain for the channel is changed.
> 
> 2. When the integration time change - scale is tried to be maintained.
>    When integration time change is requested also gain for all impacted
>    channels is adjusted so that the scale is not changed, or is chaned
>    as little as possible. This is different from the RFCv1 where the
>    request was rejected if suitable gain couldn't be found for some
>    channel(s).
> 
> This logic is simple. When total gain (either caused by time or hw-gain)
> is doubled, the scale gets halved. Also, the supported times are given a
> 'multiplier' value which tells how much they increase the total gain.
> 
> However, when I wrote this logic in bu27034 driver, I made quite a few
> errors on the way - and driver got pretty big. As I am writing drivers
> for two other sensors (RGB C/IR + flicker BU27010 and RGB C/IR BU27008)
> with similar gain-time-scale logic I thought that adding common helpers
> for these computations might be wise. I hope this way all the bugs will
> be concentrated in one place and not in every individual driver ;)
> 
> Hence, this series also intriduces IIO gain-time-scale helpers
> (abbreviated as gts-helpers) + a couple of KUnit tests for the most
> hairy parts.
> 
> Speaking of which - testing the devm interfaces requires a 'dummy
> device'. There were neat helpers in DRM tests for creating and freeing
> such a device. This series moves those helpers to more generic location.
> What is worth noting is that there is something similar ongoing in the
> CCF territory:
> https://lore.kernel.org/all/20230302013822.1808711-1-sboyd@kernel.org/
> These efforts should be somehow coordinated in order to avoid any ajor
> conflicts.
> 
> Finally, these added helpers do provide some value also for drivers
> which only:
>  a) allow gain change
>   or
>  b) allow changing both the time and gain while trying to maintain the
>     scale.
> 
> For a) we provide the gain - selector (register value) table format +
> selector to gain look-ups, gain <-> scale conversions and the available
> scales helpers.
> 
> For latter case we also provide the time-tables, and actually all the
> APIs should be usable by setting the time multiplier to 1. (not testeted
> thoroughly though).
> 
> Revision history:
> v3 => v4: (Stil ostly fixes to review comments from Andy and Jonathan)
> - more accurate change-log in individual patches
> - dt-binding and maintainer patches unchanged.
> - dropped unused helpers and converted ones currently used only internally
>   to static.
> - extracted "dummy device" creation helpers from DRM tests.
> - added tests for devm APIs
> - dropped scale for PROCESSED channel in BU27034 and converted mLux
>   values to luxes
> - dropped channel 2 GAIN setting which can't be done due to HW
>   limitations.
> 
> v2 => v3: (Mostly fixes to review comments from Andy and Jonathan)
> - dt-binding and maintainer patches unchanged.
> - iio-gts-helper tests: Use namespaces
> - iio-gts-helpers + bu27034 plenty of changes. See more comprehensive
>   changelog in individual patches.
> 
> RFCv1 => v2:
>   dt-bindings:
> 	- Fix binding file name and id by using comma instead of a hyphen to
> 	  separate the vendor and part names.
>   gts-helpers:
> 	- fix include guardian
> 	- Improve kernel doc for iio_init_iio_gts.
> 	- Add iio_gts_scale_to_total_gain
> 	- Add iio_gts_total_gain_to_scale
> 	- Fix review comments from Jonathan
> 	  - add documentation to few functions
> 	  - replace 0xffffffffffffffffLLU by U64_MAX
> 	  - some styling fixes
> 	  - drop unnecessary NULL checks
> 	  - order function arguments by  in / out purpose
> 	  - drop GAIN_SCALE_ITIME_MS()
> 	- Add helpers for available scales and times
> 	- Rename to iio-gts-helpers
>   gts-tests:
> 	- add tests for available scales/times helpers
> 	- adapt to renamed iio-gts-helpers.h header
>   bu27034-driver:
> 	- (really) protect read-only registers
> 	- fix get and set gain
> 	- buffered mode
> 	- Protect the whole sequences including meas_en/meas_dis to avoid messing
> 	  up the enable / disable order
> 	- typofixes / doc improvements
> 	- change dropped GAIN_SCALE_ITIME_MS() to GAIN_SCALE_ITIME_US()
> 	- use more accurate scale for lux channel (milli lux)
> 	- provide available scales / integration times (using helpers).
> 	- adapt to renamed iio-gts-helpers.h file
> 	- bu27034 - longer lines in Kconfig
> 	- Drop bu27034_meas_en and bu27034_meas_dis wrappers.
> 	- Change device-name from bu27034-als to bu27034
>   MAINTAINERS:
> 	- Add iio-list
> 
> ---
> 
> 
> 
> Matti Vaittinen (8):
>   drm/tests: helpers: rename generic helpers
>   kunit: drm/tests: move generic helpers
>   dt-bindings: iio: light: Support ROHM BU27034
>   iio: light: Add gain-time-scale helpers
>   iio: test: test gain-time-scale helpers
>   MAINTAINERS: Add IIO gain-time-scale helpers
>   iio: light: ROHM BU27034 Ambient Light Sensor
>   MAINTAINERS: Add ROHM BU27034
> 
>  .../bindings/iio/light/rohm,bu27034.yaml      |   46 +
>  MAINTAINERS                                   |   14 +
>  drivers/base/test/Kconfig                     |    5 +
>  drivers/base/test/Makefile                    |    2 +
>  drivers/base/test/test_kunit_device.c         |   83 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  .../gpu/drm/tests/drm_client_modeset_test.c   |    5 +-
>  drivers/gpu/drm/tests/drm_kunit_helpers.c     |   69 -
>  drivers/gpu/drm/tests/drm_managed_test.c      |    5 +-
>  drivers/gpu/drm/tests/drm_modes_test.c        |    5 +-
>  drivers/gpu/drm/tests/drm_probe_helper_test.c |    5 +-
>  drivers/gpu/drm/vc4/Kconfig                   |    1 +
>  drivers/gpu/drm/vc4/tests/vc4_mock.c          |    3 +-
>  .../gpu/drm/vc4/tests/vc4_test_pv_muxing.c    |    9 +-
>  drivers/iio/Kconfig                           |    3 +
>  drivers/iio/Makefile                          |    1 +
>  drivers/iio/industrialio-gts-helper.c         |  990 +++++++++++
>  drivers/iio/light/Kconfig                     |   14 +
>  drivers/iio/light/Makefile                    |    1 +
>  drivers/iio/light/rohm-bu27034.c              | 1491 +++++++++++++++++
>  drivers/iio/test/Kconfig                      |   16 +
>  drivers/iio/test/Makefile                     |    1 +
>  drivers/iio/test/iio-test-gts.c               |  461 +++++
>  include/drm/drm_kunit_helpers.h               |    7 +-
>  include/linux/iio/iio-gts-helper.h            |  113 ++
>  25 files changed, 3265 insertions(+), 87 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/rohm,bu27034.yaml
>  create mode 100644 drivers/base/test/test_kunit_device.c
>  create mode 100644 drivers/iio/industrialio-gts-helper.c
>  create mode 100644 drivers/iio/light/rohm-bu27034.c
>  create mode 100644 drivers/iio/test/iio-test-gts.c
>  create mode 100644 include/linux/iio/iio-gts-helper.h
> 
> 
> base-commit: eeac8ede17557680855031c6f305ece2378af326

