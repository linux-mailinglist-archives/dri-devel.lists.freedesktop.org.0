Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D717FEE2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 14:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49D389BB0;
	Tue, 10 Mar 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D7589BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:43:18 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de
 [95.90.212.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E6E8246B1;
 Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583847798;
 bh=+RM84hA/52FAoxLCzGV9zFlHrxbSTLvQ3c6TsCgGhI0=;
 h=From:To:Cc:Subject:Date:From;
 b=v9y5OS535F8bzij3us6O2hX9GlFugzZxFiAYYlgNYyuqnnWcZg842+a7nP0RAakmT
 wQ3z/SYJ133kIaxTMcZxj+i4YVsawjSARWDybsR0/ok8yPUjSmq0olpF9tFdNHWdkf
 IQW3QYRw8XGsSxyrc5I6G9OWKk1iV6RjuLaMYJM4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jBfAA-0005vF-TE; Tue, 10 Mar 2020 14:43:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 00/22] Move media documentation files
Date: Tue, 10 Mar 2020 14:42:51 +0100
Message-Id: <cover.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Michael Krufky <mkrufky@linuxtv.org>, NXP Linux Team <linux-imx@nxp.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tian Shu Qiu <tian.shu.qiu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Malcolm Priestley <tvboxspy@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, dri-devel@lists.freedesktop.org,
 Mike Isely <isely@pobox.com>, linux-arm-kernel@lists.infradead.org,
 Antoine Jacquet <royale@zerezo.com>, Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's a second version of a patch series with moves the media documents
to better places.

The first version was actually a RFC. This one is more complete. Yet,
my plan is to merge it only at the media trees only after the end of the
next merge window.

I'm preparing several patches on the top of this series, with are updating
old documents that were at the driver-specific part of the documentation.

Mauro Carvalho Chehab (22):
  media: docs: avermedia.rst: mark a table as such
  media: docs: move soc-camera.rst to staging
  media: docs: split cpia2.rst on two files
  media: docs: split ci.rst into uAPI and user guide docs
  media: docs: split meye.rst into admin and uAPI docs
  media: docs: split vimc.rst into devel and admin parts
  media: docs: split development info from bttv.rst
  media: docs: split development info from cx88.rst
  media: docs: split cx2341x.rst into different audiences
  media: docs: cx18-streams.c: fix broken references to docs
  media: docs: split uAPI info from davinci-vpbe.rst
  media: docs: split uAPI info from fimc.rst
  media: docs: split uAPI info from saa7134-devel.rst
  media: docs: split uAPI info from omap3isp.rst
  media: docs: split uAPI info from imx.rst
  media: docs: move uAPI book to userspace-api/media
  media: docs: kAPI docs: move them to driver-api
  media: docs: move fourcc file to the uAPI document
  media: docs: move user-facing docs to the admin guide
  media: docs: move driver-specific info to driver-api
  media: docs: add an uAPI chapter for driver-specific stuff
  media: docs: get rid of Documentation/media/

 .../ABI/testing/debugfs-cec-error-inj         |   2 +-
 Documentation/Makefile                        |  10 +-
 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-parameters.txt         |   4 +-
 .../media}/au0828-cardlist.rst                |   0
 .../media}/avermedia.rst                      |   4 +
 .../media}/bt8xx.rst                          |   8 +-
 .../media}/bttv-cardlist.rst                  |   0
 .../media}/bttv.rst                           | 120 ------------
 .../media}/cafe_ccic.rst                      |   0
 .../media}/cardlist.rst                       |   0
 .../media}/cards.rst                          |   0
 Documentation/admin-guide/media/ci.rst        |  77 ++++++++
 .../media}/cpia2.rst                          |  46 -----
 .../media}/cx23885-cardlist.rst               |   0
 .../media}/cx88-cardlist.rst                  |   0
 Documentation/admin-guide/media/cx88.rst      |  58 ++++++
 .../media}/davinci-vpbe.rst                   |  42 +---
 .../media}/em28xx-cardlist.rst                |   0
 .../dvb-drivers => admin-guide/media}/faq.rst |   0
 .../media}/fimc.rst                           |  22 +--
 .../media}/gspca-cardlist.rst                 |   0
 .../v4l-drivers => admin-guide/media}/imx.rst |  88 +--------
 .../media}/imx7.rst                           |   0
 Documentation/admin-guide/media/index.rst     | 104 ++++++++++
 .../media}/intro.rst                          |   0
 .../media}/ipu3.rst                           |   0
 .../media}/ipu3_rcb.svg                       |   0
 .../media}/ivtv-cardlist.rst                  |   0
 .../media}/ivtv.rst                           |   0
 .../media}/lmedm04.rst                        |   0
 .../media}/meye.rst                           |  41 ----
 Documentation/admin-guide/media/omap3isp.rst  |  92 +++++++++
 .../media}/omap4_camera.rst                   |   0
 .../media}/opera-firmware.rst                 |   0
 .../media}/philips.rst                        |   0
 .../media}/pulse8-cec.rst                     |   0
 .../media}/qcom_camss.rst                     |   0
 .../media}/qcom_camss_8x96_graph.dot          |   0
 .../media}/qcom_camss_graph.dot               |   0
 .../media}/rcar-fdp1.rst                      |   0
 .../media}/saa7134-cardlist.rst               |   0
 Documentation/admin-guide/media/saa7134.rst   |  61 ++++++
 .../media}/saa7164-cardlist.rst               |   0
 .../media}/si470x.rst                         |   0
 .../media}/si4713.rst                         |   0
 .../media}/si476x.rst                         |   0
 .../media}/technisat.rst                      |   0
 .../media}/tm6000-cardlist.rst                |   0
 .../media}/ttusb-dec.rst                      |   0
 .../media}/tuner-cardlist.rst                 |   0
 .../media}/udev.rst                           |   0
 .../media}/usbvision-cardlist.rst             |   0
 .../media}/v4l-with-ir.rst                    |   0
 .../media}/vimc.dot                           |   0
 .../media}/vimc.rst                           |  11 --
 .../media}/vivid.rst                          |   0
 .../media}/zr364xx.rst                        |   0
 Documentation/doc-guide/parse-headers.rst     |   2 +-
 Documentation/driver-api/index.rst            |   1 +
 .../kapi => driver-api/media}/cec-core.rst    |   0
 .../{media/kapi => driver-api/media}/csi2.rst |   0
 .../driver-api/media/drivers/bttv-devel.rst   | 123 ++++++++++++
 .../media/drivers}/contributors.rst           |   0
 .../driver-api/media/drivers/cpia2_devel.rst  |  56 ++++++
 .../media/drivers/cx2341x-devel.rst}          | 175 -----------------
 .../media/drivers/cx88-devel.rst}             |  52 -----
 .../media/drivers/davinci-vpbe-devel.rst      |  39 ++++
 .../media/drivers}/dvb-usb.rst                |   0
 .../driver-api/media/drivers/fimc-devel.rst   |  33 ++++
 .../media/drivers}/frontends.rst              |   0
 .../media/drivers}/index.rst                  |  40 ++--
 .../media/drivers}/pvrusb2.rst                |   0
 .../media/drivers}/pxa_camera.rst             |   0
 .../media/drivers}/radiotrack.rst             |   0
 .../media/drivers/saa7134-devel.rst}          |  48 -----
 .../media/drivers}/sh_mobile_ceu_camera.rst   |   0
 .../media/drivers}/tuners.rst                 |   0
 .../driver-api/media/drivers/vimc-devel.rst   |  15 ++
 .../kapi => driver-api/media}/dtv-ca.rst      |   0
 .../kapi => driver-api/media}/dtv-common.rst  |   0
 .../kapi => driver-api/media}/dtv-core.rst    |   0
 .../kapi => driver-api/media}/dtv-demux.rst   |   0
 .../media}/dtv-frontend.rst                   |   0
 .../kapi => driver-api/media}/dtv-net.rst     |   0
 .../media/index.rst}                          |  14 +-
 .../kapi => driver-api/media}/mc-core.rst     |   0
 .../kapi => driver-api/media}/rc-core.rst     |   0
 .../kapi => driver-api/media}/v4l2-async.rst  |   0
 .../kapi => driver-api/media}/v4l2-clocks.rst |   0
 .../kapi => driver-api/media}/v4l2-common.rst |   0
 .../media}/v4l2-controls.rst                  |   0
 .../kapi => driver-api/media}/v4l2-core.rst   |   0
 .../kapi => driver-api/media}/v4l2-dev.rst    |   0
 .../kapi => driver-api/media}/v4l2-device.rst |   0
 .../media}/v4l2-dv-timings.rst                |   0
 .../kapi => driver-api/media}/v4l2-event.rst  |   0
 .../kapi => driver-api/media}/v4l2-fh.rst     |   0
 .../media}/v4l2-flash-led-class.rst           |   0
 .../kapi => driver-api/media}/v4l2-fwnode.rst |   0
 .../kapi => driver-api/media}/v4l2-intro.rst  |   0
 .../kapi => driver-api/media}/v4l2-mc.rst     |   0
 .../media}/v4l2-mediabus.rst                  |   0
 .../media}/v4l2-mem2mem.rst                   |   0
 .../kapi => driver-api/media}/v4l2-rect.rst   |   0
 .../kapi => driver-api/media}/v4l2-subdev.rst |   0
 .../kapi => driver-api/media}/v4l2-tuner.rst  |   0
 .../media}/v4l2-tveeprom.rst                  |   0
 .../media}/v4l2-videobuf.rst                  |   0
 .../media}/v4l2-videobuf2.rst                 |   0
 Documentation/fb/api.rst                      |   4 +-
 Documentation/index.rst                       |   1 -
 Documentation/media/cec-drivers/index.rst     |  34 ----
 Documentation/media/index.rst                 |  26 ---
 .../it_IT/doc-guide/parse-headers.rst         |   2 +-
 .../zh_CN/video4linux/omap3isp.txt            |   4 +-
 .../zh_CN/video4linux/v4l2-framework.txt      |   6 +-
 Documentation/userspace-api/index.rst         |   1 +
 .../{ => userspace-api}/media/Makefile        |   2 +-
 .../media/audio.h.rst.exceptions              |   0
 .../media/ca.h.rst.exceptions                 |   0
 .../media/cec.h.rst.exceptions                |   0
 .../media}/cec/cec-api.rst                    |   2 +-
 .../media}/cec/cec-func-close.rst             |   2 +-
 .../media}/cec/cec-func-ioctl.rst             |   2 +-
 .../media}/cec/cec-func-open.rst              |   2 +-
 .../media}/cec/cec-func-poll.rst              |   2 +-
 .../media}/cec/cec-funcs.rst                  |   2 +-
 .../media}/cec/cec-header.rst                 |   2 +-
 .../media}/cec/cec-intro.rst                  |   2 +-
 .../media}/cec/cec-ioc-adap-g-caps.rst        |   2 +-
 .../media}/cec/cec-ioc-adap-g-conn-info.rst   |   0
 .../media}/cec/cec-ioc-adap-g-log-addrs.rst   |   2 +-
 .../media}/cec/cec-ioc-adap-g-phys-addr.rst   |   2 +-
 .../media}/cec/cec-ioc-dqevent.rst            |   2 +-
 .../media}/cec/cec-ioc-g-mode.rst             |   2 +-
 .../media}/cec/cec-ioc-receive.rst            |   2 +-
 .../media}/cec/cec-pin-error-inj.rst          |   2 +-
 .../{ => userspace-api}/media/conf_nitpick.py |   0
 .../media/dmx.h.rst.exceptions                |   0
 .../media/drivers/cx2341x-uapi.rst            | 179 ++++++++++++++++++
 .../userspace-api/media/drivers/imx-uapi.rst  | 125 ++++++++++++
 .../media/drivers}/index.rst                  |  39 +---
 .../media/drivers}/max2175.rst                |   2 +-
 .../userspace-api/media/drivers/meye-uapi.rst |  53 ++++++
 .../media/drivers/omap3isp-uapi.rst}          |  80 +-------
 .../media/drivers}/uvcvideo.rst               |   0
 .../dvb/audio-bilingual-channel-select.rst    |   2 +-
 .../media}/dvb/audio-channel-select.rst       |   2 +-
 .../media}/dvb/audio-clear-buffer.rst         |   2 +-
 .../media}/dvb/audio-continue.rst             |   2 +-
 .../media}/dvb/audio-fclose.rst               |   2 +-
 .../media}/dvb/audio-fopen.rst                |   2 +-
 .../media}/dvb/audio-fwrite.rst               |   2 +-
 .../media}/dvb/audio-get-capabilities.rst     |   2 +-
 .../media}/dvb/audio-get-status.rst           |   2 +-
 .../media}/dvb/audio-pause.rst                |   2 +-
 .../media}/dvb/audio-play.rst                 |   2 +-
 .../media}/dvb/audio-select-source.rst        |   2 +-
 .../media}/dvb/audio-set-av-sync.rst          |   2 +-
 .../media}/dvb/audio-set-bypass-mode.rst      |   2 +-
 .../media}/dvb/audio-set-id.rst               |   2 +-
 .../media}/dvb/audio-set-mixer.rst            |   2 +-
 .../media}/dvb/audio-set-mute.rst             |   2 +-
 .../media}/dvb/audio-set-streamtype.rst       |   2 +-
 .../media}/dvb/audio-stop.rst                 |   2 +-
 .../media}/dvb/audio.rst                      |   2 +-
 .../media}/dvb/audio_data_types.rst           |   2 +-
 .../media}/dvb/audio_function_calls.rst       |   2 +-
 .../media}/dvb/ca-fclose.rst                  |   2 +-
 .../media}/dvb/ca-fopen.rst                   |   2 +-
 .../media}/dvb/ca-get-cap.rst                 |   2 +-
 .../media}/dvb/ca-get-descr-info.rst          |   2 +-
 .../media}/dvb/ca-get-msg.rst                 |   2 +-
 .../media}/dvb/ca-get-slot-info.rst           |   2 +-
 .../media}/dvb/ca-reset.rst                   |   2 +-
 .../media}/dvb/ca-send-msg.rst                |   2 +-
 .../media}/dvb/ca-set-descr.rst               |   2 +-
 .../uapi => userspace-api/media}/dvb/ca.rst   |   3 +-
 .../media}/dvb/ca_data_types.rst              |   2 +-
 .../media}/dvb/ca_function_calls.rst          |   2 +-
 .../media/dvb/ca_high_level.rst}              |  90 +--------
 .../media}/dvb/demux.rst                      |   2 +-
 .../media}/dvb/dmx-add-pid.rst                |   2 +-
 .../media}/dvb/dmx-expbuf.rst                 |   2 +-
 .../media}/dvb/dmx-fclose.rst                 |   2 +-
 .../media}/dvb/dmx-fopen.rst                  |   2 +-
 .../media}/dvb/dmx-fread.rst                  |   2 +-
 .../media}/dvb/dmx-fwrite.rst                 |   2 +-
 .../media}/dvb/dmx-get-pes-pids.rst           |   2 +-
 .../media}/dvb/dmx-get-stc.rst                |   2 +-
 .../media}/dvb/dmx-mmap.rst                   |   2 +-
 .../media}/dvb/dmx-munmap.rst                 |   2 +-
 .../media}/dvb/dmx-qbuf.rst                   |   2 +-
 .../media}/dvb/dmx-querybuf.rst               |   2 +-
 .../media}/dvb/dmx-remove-pid.rst             |   2 +-
 .../media}/dvb/dmx-reqbufs.rst                |   2 +-
 .../media}/dvb/dmx-set-buffer-size.rst        |   2 +-
 .../media}/dvb/dmx-set-filter.rst             |   2 +-
 .../media}/dvb/dmx-set-pes-filter.rst         |   2 +-
 .../media}/dvb/dmx-start.rst                  |   2 +-
 .../media}/dvb/dmx-stop.rst                   |   2 +-
 .../media}/dvb/dmx_fcalls.rst                 |   2 +-
 .../media}/dvb/dmx_types.rst                  |   2 +-
 .../media}/dvb/dvb-fe-read-status.rst         |   2 +-
 .../media}/dvb/dvb-frontend-event.rst         |   2 +-
 .../media}/dvb/dvb-frontend-parameters.rst    |   2 +-
 .../media}/dvb/dvbapi.rst                     |   2 +-
 .../media}/dvb/dvbproperty.rst                |   2 +-
 .../media}/dvb/dvbstb.svg                     |   2 +-
 .../media}/dvb/examples.rst                   |   2 +-
 .../media}/dvb/fe-bandwidth-t.rst             |   2 +-
 .../media}/dvb/fe-diseqc-recv-slave-reply.rst |   2 +-
 .../media}/dvb/fe-diseqc-reset-overload.rst   |   2 +-
 .../media}/dvb/fe-diseqc-send-burst.rst       |   2 +-
 .../media}/dvb/fe-diseqc-send-master-cmd.rst  |   2 +-
 .../dvb/fe-dishnetwork-send-legacy-cmd.rst    |   2 +-
 .../media}/dvb/fe-enable-high-lnb-voltage.rst |   2 +-
 .../media}/dvb/fe-get-event.rst               |   2 +-
 .../media}/dvb/fe-get-frontend.rst            |   2 +-
 .../media}/dvb/fe-get-info.rst                |   2 +-
 .../media}/dvb/fe-get-property.rst            |   2 +-
 .../media}/dvb/fe-read-ber.rst                |   2 +-
 .../media}/dvb/fe-read-signal-strength.rst    |   2 +-
 .../media}/dvb/fe-read-snr.rst                |   2 +-
 .../media}/dvb/fe-read-status.rst             |   2 +-
 .../media}/dvb/fe-read-uncorrected-blocks.rst |   2 +-
 .../media}/dvb/fe-set-frontend-tune-mode.rst  |   2 +-
 .../media}/dvb/fe-set-frontend.rst            |   2 +-
 .../media}/dvb/fe-set-tone.rst                |   2 +-
 .../media}/dvb/fe-set-voltage.rst             |   2 +-
 .../media}/dvb/fe-type-t.rst                  |   2 +-
 .../media}/dvb/fe_property_parameters.rst     |   2 +-
 .../media}/dvb/frontend-header.rst            |   2 +-
 .../dvb/frontend-property-cable-systems.rst   |   2 +-
 .../frontend-property-satellite-systems.rst   |   2 +-
 .../frontend-property-terrestrial-systems.rst |   2 +-
 .../media}/dvb/frontend-stat-properties.rst   |   2 +-
 .../media}/dvb/frontend.rst                   |   2 +-
 .../media}/dvb/frontend_f_close.rst           |   2 +-
 .../media}/dvb/frontend_f_open.rst            |   2 +-
 .../media}/dvb/frontend_fcalls.rst            |   2 +-
 .../media}/dvb/frontend_legacy_api.rst        |   2 +-
 .../media}/dvb/frontend_legacy_dvbv3_api.rst  |   2 +-
 .../media}/dvb/headers.rst                    |   2 +-
 .../media}/dvb/intro.rst                      |   2 +-
 .../media}/dvb/legacy_dvb_apis.rst            |   2 +-
 .../media}/dvb/net-add-if.rst                 |   2 +-
 .../media}/dvb/net-get-if.rst                 |   2 +-
 .../media}/dvb/net-remove-if.rst              |   2 +-
 .../media}/dvb/net-types.rst                  |   2 +-
 .../uapi => userspace-api/media}/dvb/net.rst  |   2 +-
 .../media}/dvb/query-dvb-frontend-info.rst    |   2 +-
 .../media}/dvb/video-clear-buffer.rst         |   2 +-
 .../media}/dvb/video-command.rst              |   2 +-
 .../media}/dvb/video-continue.rst             |   2 +-
 .../media}/dvb/video-fast-forward.rst         |   2 +-
 .../media}/dvb/video-fclose.rst               |   2 +-
 .../media}/dvb/video-fopen.rst                |   2 +-
 .../media}/dvb/video-freeze.rst               |   2 +-
 .../media}/dvb/video-fwrite.rst               |   2 +-
 .../media}/dvb/video-get-capabilities.rst     |   2 +-
 .../media}/dvb/video-get-event.rst            |   2 +-
 .../media}/dvb/video-get-frame-count.rst      |   2 +-
 .../media}/dvb/video-get-pts.rst              |   2 +-
 .../media}/dvb/video-get-size.rst             |   2 +-
 .../media}/dvb/video-get-status.rst           |   2 +-
 .../media}/dvb/video-play.rst                 |   2 +-
 .../media}/dvb/video-select-source.rst        |   2 +-
 .../media}/dvb/video-set-blank.rst            |   2 +-
 .../media}/dvb/video-set-display-format.rst   |   2 +-
 .../media}/dvb/video-set-format.rst           |   2 +-
 .../media}/dvb/video-set-streamtype.rst       |   2 +-
 .../media}/dvb/video-slowmotion.rst           |   2 +-
 .../media}/dvb/video-stillpicture.rst         |   2 +-
 .../media}/dvb/video-stop.rst                 |   2 +-
 .../media}/dvb/video-try-command.rst          |   2 +-
 .../media}/dvb/video.rst                      |   2 +-
 .../media}/dvb/video_function_calls.rst       |   2 +-
 .../media}/dvb/video_types.rst                |   2 +-
 .../media}/fdl-appendix.rst                   |   2 +-
 .../media/frontend.h.rst.exceptions           |   0
 .../media}/gen-errors.rst                     |   2 +-
 .../media/index.rst}                          |  16 +-
 .../{ => userspace-api}/media/intro.rst       |   0
 .../media/lirc.h.rst.exceptions               |   0
 .../media/media.h.rst.exceptions              |   0
 .../mediactl/media-controller-intro.rst       |   2 +-
 .../mediactl/media-controller-model.rst       |   2 +-
 .../media}/mediactl/media-controller.rst      |   2 +-
 .../media}/mediactl/media-func-close.rst      |   2 +-
 .../media}/mediactl/media-func-ioctl.rst      |   2 +-
 .../media}/mediactl/media-func-open.rst       |   2 +-
 .../media}/mediactl/media-funcs.rst           |   2 +-
 .../media}/mediactl/media-header.rst          |   2 +-
 .../media}/mediactl/media-ioc-device-info.rst |   2 +-
 .../mediactl/media-ioc-enum-entities.rst      |   2 +-
 .../media}/mediactl/media-ioc-enum-links.rst  |   2 +-
 .../media}/mediactl/media-ioc-g-topology.rst  |   2 +-
 .../mediactl/media-ioc-request-alloc.rst      |   2 +-
 .../media}/mediactl/media-ioc-setup-link.rst  |   2 +-
 .../mediactl/media-request-ioc-queue.rst      |   2 +-
 .../mediactl/media-request-ioc-reinit.rst     |   2 +-
 .../media}/mediactl/media-types.rst           |   2 +-
 .../media}/mediactl/request-api.rst           |   2 +-
 .../media}/mediactl/request-func-close.rst    |   2 +-
 .../media}/mediactl/request-func-ioctl.rst    |   2 +-
 .../media}/mediactl/request-func-poll.rst     |   2 +-
 .../media/net.h.rst.exceptions                |   0
 .../media}/rc/keytable.c.rst                  |   2 +-
 .../media}/rc/lirc-dev-intro.rst              |   2 +-
 .../media}/rc/lirc-dev.rst                    |   2 +-
 .../media}/rc/lirc-func.rst                   |   2 +-
 .../media}/rc/lirc-get-features.rst           |   2 +-
 .../media}/rc/lirc-get-rec-mode.rst           |   2 +-
 .../media}/rc/lirc-get-rec-resolution.rst     |   2 +-
 .../media}/rc/lirc-get-send-mode.rst          |   2 +-
 .../media}/rc/lirc-get-timeout.rst            |   2 +-
 .../media}/rc/lirc-header.rst                 |   2 +-
 .../media}/rc/lirc-read.rst                   |   2 +-
 .../rc/lirc-set-measure-carrier-mode.rst      |   2 +-
 .../media}/rc/lirc-set-rec-carrier-range.rst  |   2 +-
 .../media}/rc/lirc-set-rec-carrier.rst        |   2 +-
 .../rc/lirc-set-rec-timeout-reports.rst       |   2 +-
 .../media}/rc/lirc-set-rec-timeout.rst        |   2 +-
 .../media}/rc/lirc-set-send-carrier.rst       |   2 +-
 .../media}/rc/lirc-set-send-duty-cycle.rst    |   2 +-
 .../media}/rc/lirc-set-transmitter-mask.rst   |   2 +-
 .../media}/rc/lirc-set-wideband-receiver.rst  |   2 +-
 .../media}/rc/lirc-write.rst                  |   2 +-
 .../media}/rc/rc-intro.rst                    |   2 +-
 .../media}/rc/rc-protos.rst                   |   0
 .../media}/rc/rc-sysfs-nodes.rst              |   2 +-
 .../media}/rc/rc-table-change.rst             |   2 +-
 .../media}/rc/rc-tables.rst                   |   2 +-
 .../media}/rc/remote_controllers.rst          |   2 +-
 .../media/typical_media_device.svg            |   2 +-
 .../media}/v4l/app-pri.rst                    |   2 +-
 .../media}/v4l/async.rst                      |   2 +-
 .../media}/v4l/audio.rst                      |   2 +-
 .../media}/v4l/bayer.svg                      |   2 +-
 .../media}/v4l/biblio.rst                     |   2 +-
 .../media}/v4l/buffer.rst                     |   2 +-
 .../media}/v4l/capture-example.rst            |   2 +-
 .../media}/v4l/capture.c.rst                  |   2 +-
 .../media}/v4l/colorspaces-defs.rst           |   2 +-
 .../media}/v4l/colorspaces-details.rst        |   2 +-
 .../media}/v4l/colorspaces.rst                |   2 +-
 .../media}/v4l/common-defs.rst                |   2 +-
 .../media}/v4l/common.rst                     |   3 +-
 .../media}/v4l/compat.rst                     |   2 +-
 .../media}/v4l/constraints.svg                |   2 +-
 .../media}/v4l/control.rst                    |   2 +-
 .../uapi => userspace-api/media}/v4l/crop.rst |   2 +-
 .../uapi => userspace-api/media}/v4l/crop.svg |   2 +-
 .../media}/v4l/depth-formats.rst              |   2 +-
 .../media}/v4l/dev-capture.rst                |   2 +-
 .../media}/v4l/dev-decoder.rst                |   0
 .../media}/v4l/dev-event.rst                  |   2 +-
 .../media}/v4l/dev-mem2mem.rst                |   2 +-
 .../media}/v4l/dev-meta.rst                   |   2 +-
 .../media}/v4l/dev-osd.rst                    |   2 +-
 .../media}/v4l/dev-output.rst                 |   2 +-
 .../media}/v4l/dev-overlay.rst                |   2 +-
 .../media}/v4l/dev-radio.rst                  |   2 +-
 .../media}/v4l/dev-raw-vbi.rst                |   2 +-
 .../media}/v4l/dev-rds.rst                    |   2 +-
 .../media}/v4l/dev-sdr.rst                    |   2 +-
 .../media}/v4l/dev-sliced-vbi.rst             |   4 +-
 .../media}/v4l/dev-stateless-decoder.rst      |   0
 .../media}/v4l/dev-subdev.rst                 |   2 +-
 .../media}/v4l/dev-touch.rst                  |   2 +-
 .../media}/v4l/devices.rst                    |   2 +-
 .../media}/v4l/diff-v4l.rst                   |   2 +-
 .../media}/v4l/dmabuf.rst                     |   2 +-
 .../media}/v4l/dv-timings.rst                 |   2 +-
 .../media}/v4l/ext-ctrls-camera.rst           |   2 +-
 .../media}/v4l/ext-ctrls-codec.rst            |   4 +-
 .../media}/v4l/ext-ctrls-detect.rst           |   2 +-
 .../media}/v4l/ext-ctrls-dv.rst               |   2 +-
 .../media}/v4l/ext-ctrls-flash.rst            |   2 +-
 .../media}/v4l/ext-ctrls-fm-rx.rst            |   2 +-
 .../media}/v4l/ext-ctrls-fm-tx.rst            |   2 +-
 .../media}/v4l/ext-ctrls-image-process.rst    |   4 +-
 .../media}/v4l/ext-ctrls-image-source.rst     |   2 +-
 .../media}/v4l/ext-ctrls-jpeg.rst             |   2 +-
 .../media}/v4l/ext-ctrls-rf-tuner.rst         |   2 +-
 .../media}/v4l/extended-controls.rst          |   2 +-
 .../media}/v4l/field-order.rst                |   2 +-
 .../media}/v4l/fieldseq_bt.svg                |   2 +-
 .../media}/v4l/fieldseq_tb.svg                |   2 +-
 .../media}/v4l/format.rst                     |   2 +-
 .../media/v4l}/fourcc.rst                     |   0
 .../media}/v4l/func-close.rst                 |   2 +-
 .../media}/v4l/func-ioctl.rst                 |   2 +-
 .../media}/v4l/func-mmap.rst                  |   2 +-
 .../media}/v4l/func-munmap.rst                |   2 +-
 .../media}/v4l/func-open.rst                  |   2 +-
 .../media}/v4l/func-poll.rst                  |   2 +-
 .../media}/v4l/func-read.rst                  |   2 +-
 .../media}/v4l/func-select.rst                |   2 +-
 .../media}/v4l/func-write.rst                 |   2 +-
 .../media}/v4l/hist-v4l2.rst                  |   2 +-
 .../media}/v4l/hsv-formats.rst                |   2 +-
 .../uapi => userspace-api/media}/v4l/io.rst   |   2 +-
 .../media}/v4l/libv4l-introduction.rst        |   2 +-
 .../media}/v4l/libv4l.rst                     |   2 +-
 .../media}/v4l/meta-formats.rst               |   2 +-
 .../uapi => userspace-api/media}/v4l/mmap.rst |   2 +-
 .../media}/v4l/nv12mt.svg                     |   2 +-
 .../media}/v4l/nv12mt_example.svg             |   2 +-
 .../uapi => userspace-api/media}/v4l/open.rst |   2 +-
 .../media}/v4l/pipeline.dot                   |   0
 .../media}/v4l/pixfmt-bayer.rst               |   2 +-
 .../media}/v4l/pixfmt-cnf4.rst                |   0
 .../media}/v4l/pixfmt-compressed.rst          |   2 +-
 .../media}/v4l/pixfmt-grey.rst                |   2 +-
 .../media}/v4l/pixfmt-indexed.rst             |   2 +-
 .../media}/v4l/pixfmt-intro.rst               |   2 +-
 .../media}/v4l/pixfmt-inzi.rst                |   2 +-
 .../media}/v4l/pixfmt-m420.rst                |   2 +-
 .../media}/v4l/pixfmt-meta-d4xx.rst           |   2 +-
 .../media}/v4l/pixfmt-meta-intel-ipu3.rst     |   2 +-
 .../media}/v4l/pixfmt-meta-uvc.rst            |   2 +-
 .../media}/v4l/pixfmt-meta-vivid.rst          |   2 +-
 .../media}/v4l/pixfmt-meta-vsp1-hgo.rst       |   2 +-
 .../media}/v4l/pixfmt-meta-vsp1-hgt.rst       |   2 +-
 .../media}/v4l/pixfmt-nv12.rst                |   2 +-
 .../media}/v4l/pixfmt-nv12m.rst               |   2 +-
 .../media}/v4l/pixfmt-nv12mt.rst              |   2 +-
 .../media}/v4l/pixfmt-nv16.rst                |   2 +-
 .../media}/v4l/pixfmt-nv16m.rst               |   2 +-
 .../media}/v4l/pixfmt-nv24.rst                |   2 +-
 .../media}/v4l/pixfmt-packed-hsv.rst          |   2 +-
 .../media}/v4l/pixfmt-packed-yuv.rst          |   2 +-
 .../media}/v4l/pixfmt-reserved.rst            |   4 +-
 .../media}/v4l/pixfmt-rgb.rst                 |   2 +-
 .../media}/v4l/pixfmt-sdr-cs08.rst            |   2 +-
 .../media}/v4l/pixfmt-sdr-cs14le.rst          |   2 +-
 .../media}/v4l/pixfmt-sdr-cu08.rst            |   2 +-
 .../media}/v4l/pixfmt-sdr-cu16le.rst          |   2 +-
 .../media}/v4l/pixfmt-sdr-pcu16be.rst         |   2 +-
 .../media}/v4l/pixfmt-sdr-pcu18be.rst         |   2 +-
 .../media}/v4l/pixfmt-sdr-pcu20be.rst         |   2 +-
 .../media}/v4l/pixfmt-sdr-ru12le.rst          |   2 +-
 .../media}/v4l/pixfmt-srggb10-ipu3.rst        |   2 +-
 .../media}/v4l/pixfmt-srggb10.rst             |   2 +-
 .../media}/v4l/pixfmt-srggb10alaw8.rst        |   2 +-
 .../media}/v4l/pixfmt-srggb10dpcm8.rst        |   2 +-
 .../media}/v4l/pixfmt-srggb10p.rst            |   2 +-
 .../media}/v4l/pixfmt-srggb12.rst             |   2 +-
 .../media}/v4l/pixfmt-srggb12p.rst            |   2 +-
 .../media}/v4l/pixfmt-srggb14p.rst            |   2 +-
 .../media}/v4l/pixfmt-srggb16.rst             |   2 +-
 .../media}/v4l/pixfmt-srggb8.rst              |   2 +-
 .../media}/v4l/pixfmt-tch-td08.rst            |   2 +-
 .../media}/v4l/pixfmt-tch-td16.rst            |   2 +-
 .../media}/v4l/pixfmt-tch-tu08.rst            |   2 +-
 .../media}/v4l/pixfmt-tch-tu16.rst            |   2 +-
 .../media}/v4l/pixfmt-uv8.rst                 |   2 +-
 .../media}/v4l/pixfmt-uyvy.rst                |   2 +-
 .../media}/v4l/pixfmt-v4l2-mplane.rst         |   2 +-
 .../media}/v4l/pixfmt-v4l2.rst                |   2 +-
 .../media}/v4l/pixfmt-vyuy.rst                |   2 +-
 .../media}/v4l/pixfmt-y10.rst                 |   2 +-
 .../media}/v4l/pixfmt-y10b.rst                |   2 +-
 .../media}/v4l/pixfmt-y10p.rst                |   2 +-
 .../media}/v4l/pixfmt-y12.rst                 |   2 +-
 .../media}/v4l/pixfmt-y12i.rst                |   2 +-
 .../media}/v4l/pixfmt-y16-be.rst              |   2 +-
 .../media}/v4l/pixfmt-y16.rst                 |   2 +-
 .../media}/v4l/pixfmt-y41p.rst                |   2 +-
 .../media}/v4l/pixfmt-y8i.rst                 |   2 +-
 .../media}/v4l/pixfmt-yuv410.rst              |   2 +-
 .../media}/v4l/pixfmt-yuv411p.rst             |   2 +-
 .../media}/v4l/pixfmt-yuv420.rst              |   2 +-
 .../media}/v4l/pixfmt-yuv420m.rst             |   2 +-
 .../media}/v4l/pixfmt-yuv422m.rst             |   2 +-
 .../media}/v4l/pixfmt-yuv422p.rst             |   2 +-
 .../media}/v4l/pixfmt-yuv444m.rst             |   2 +-
 .../media}/v4l/pixfmt-yuyv.rst                |   2 +-
 .../media}/v4l/pixfmt-yvyu.rst                |   2 +-
 .../media}/v4l/pixfmt-z16.rst                 |   2 +-
 .../media}/v4l/pixfmt.rst                     |   2 +-
 .../media}/v4l/planar-apis.rst                |   2 +-
 .../media}/v4l/querycap.rst                   |   2 +-
 .../uapi => userspace-api/media}/v4l/rw.rst   |   2 +-
 .../media}/v4l/sdr-formats.rst                |   2 +-
 .../v4l/selection-api-configuration.rst       |   2 +-
 .../media}/v4l/selection-api-examples.rst     |   2 +-
 .../media}/v4l/selection-api-intro.rst        |   2 +-
 .../media}/v4l/selection-api-targets.rst      |   2 +-
 .../media}/v4l/selection-api-vs-crop-api.rst  |   2 +-
 .../media}/v4l/selection-api.rst              |   2 +-
 .../media}/v4l/selection.svg                  |   2 +-
 .../media}/v4l/selections-common.rst          |   2 +-
 .../media}/v4l/standard.rst                   |   2 +-
 .../media}/v4l/streaming-par.rst              |   2 +-
 .../media}/v4l/subdev-formats.rst             |   2 +-
 .../v4l/subdev-image-processing-crop.svg      |   2 +-
 .../v4l/subdev-image-processing-full.svg      |   2 +-
 ...-image-processing-scaling-multi-source.svg |   2 +-
 .../media}/v4l/tch-formats.rst                |   2 +-
 .../media}/v4l/tuner.rst                      |   2 +-
 .../media}/v4l/user-func.rst                  |   2 +-
 .../media}/v4l/userp.rst                      |   2 +-
 .../media}/v4l/v4l2-selection-flags.rst       |   2 +-
 .../media}/v4l/v4l2-selection-targets.rst     |   2 +-
 .../uapi => userspace-api/media}/v4l/v4l2.rst |   2 +-
 .../media}/v4l/v4l2grab-example.rst           |   2 +-
 .../media}/v4l/v4l2grab.c.rst                 |   2 +-
 .../media}/v4l/vbi_525.svg                    |   2 +-
 .../media}/v4l/vbi_625.svg                    |   2 +-
 .../media}/v4l/vbi_hsync.svg                  |   2 +-
 .../media}/v4l/video.rst                      |   2 +-
 .../media}/v4l/videodev.rst                   |   2 +-
 .../media}/v4l/vidioc-create-bufs.rst         |   2 +-
 .../media}/v4l/vidioc-cropcap.rst             |   2 +-
 .../media}/v4l/vidioc-dbg-g-chip-info.rst     |   2 +-
 .../media}/v4l/vidioc-dbg-g-register.rst      |   2 +-
 .../media}/v4l/vidioc-decoder-cmd.rst         |   2 +-
 .../media}/v4l/vidioc-dqevent.rst             |   2 +-
 .../media}/v4l/vidioc-dv-timings-cap.rst      |   2 +-
 .../media}/v4l/vidioc-encoder-cmd.rst         |   2 +-
 .../media}/v4l/vidioc-enum-dv-timings.rst     |   2 +-
 .../media}/v4l/vidioc-enum-fmt.rst            |   2 +-
 .../media}/v4l/vidioc-enum-frameintervals.rst |   2 +-
 .../media}/v4l/vidioc-enum-framesizes.rst     |   2 +-
 .../media}/v4l/vidioc-enum-freq-bands.rst     |   2 +-
 .../media}/v4l/vidioc-enumaudio.rst           |   2 +-
 .../media}/v4l/vidioc-enumaudioout.rst        |   2 +-
 .../media}/v4l/vidioc-enuminput.rst           |   2 +-
 .../media}/v4l/vidioc-enumoutput.rst          |   2 +-
 .../media}/v4l/vidioc-enumstd.rst             |   2 +-
 .../media}/v4l/vidioc-expbuf.rst              |   2 +-
 .../media}/v4l/vidioc-g-audio.rst             |   2 +-
 .../media}/v4l/vidioc-g-audioout.rst          |   2 +-
 .../media}/v4l/vidioc-g-crop.rst              |   2 +-
 .../media}/v4l/vidioc-g-ctrl.rst              |   2 +-
 .../media}/v4l/vidioc-g-dv-timings.rst        |   2 +-
 .../media}/v4l/vidioc-g-edid.rst              |   2 +-
 .../media}/v4l/vidioc-g-enc-index.rst         |   2 +-
 .../media}/v4l/vidioc-g-ext-ctrls.rst         |   2 +-
 .../media}/v4l/vidioc-g-fbuf.rst              |   2 +-
 .../media}/v4l/vidioc-g-fmt.rst               |   2 +-
 .../media}/v4l/vidioc-g-frequency.rst         |   2 +-
 .../media}/v4l/vidioc-g-input.rst             |   2 +-
 .../media}/v4l/vidioc-g-jpegcomp.rst          |   2 +-
 .../media}/v4l/vidioc-g-modulator.rst         |   2 +-
 .../media}/v4l/vidioc-g-output.rst            |   2 +-
 .../media}/v4l/vidioc-g-parm.rst              |   2 +-
 .../media}/v4l/vidioc-g-priority.rst          |   2 +-
 .../media}/v4l/vidioc-g-selection.rst         |   2 +-
 .../media}/v4l/vidioc-g-sliced-vbi-cap.rst    |   2 +-
 .../media}/v4l/vidioc-g-std.rst               |   2 +-
 .../media}/v4l/vidioc-g-tuner.rst             |   2 +-
 .../media}/v4l/vidioc-log-status.rst          |   2 +-
 .../media}/v4l/vidioc-overlay.rst             |   2 +-
 .../media}/v4l/vidioc-prepare-buf.rst         |   2 +-
 .../media}/v4l/vidioc-qbuf.rst                |   2 +-
 .../media}/v4l/vidioc-query-dv-timings.rst    |   2 +-
 .../media}/v4l/vidioc-querybuf.rst            |   2 +-
 .../media}/v4l/vidioc-querycap.rst            |   2 +-
 .../media}/v4l/vidioc-queryctrl.rst           |   2 +-
 .../media}/v4l/vidioc-querystd.rst            |   2 +-
 .../media}/v4l/vidioc-reqbufs.rst             |   2 +-
 .../media}/v4l/vidioc-s-hw-freq-seek.rst      |   2 +-
 .../media}/v4l/vidioc-streamon.rst            |   2 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   2 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   2 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   2 +-
 .../media}/v4l/vidioc-subdev-g-crop.rst       |   2 +-
 .../media}/v4l/vidioc-subdev-g-fmt.rst        |   2 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   2 +-
 .../media}/v4l/vidioc-subdev-g-selection.rst  |   2 +-
 .../media}/v4l/vidioc-subscribe-event.rst     |   2 +-
 .../media}/v4l/yuv-formats.rst                |   2 +-
 .../media/video.h.rst.exceptions              |   0
 .../media/videodev2.h.rst.exceptions          |   0
 MAINTAINERS                                   |  46 +++--
 drivers/media/dvb-frontends/dib3000.h         |   2 +-
 drivers/media/dvb-frontends/dib3000mb.c       |   2 +-
 drivers/media/dvb-frontends/eds1547.h         |   2 +-
 drivers/media/dvb-frontends/z0194a.h          |   2 +-
 drivers/media/i2c/max2175.c                   |   6 +-
 drivers/media/pci/bt8xx/Kconfig               |   2 +-
 drivers/media/pci/cx18/cx18-streams.c         |   4 +-
 drivers/media/pci/meye/Kconfig                |   2 +-
 drivers/media/platform/pxa_camera.c           |   4 +-
 drivers/media/radio/Kconfig                   |  12 +-
 drivers/media/radio/si470x/Kconfig            |   2 +-
 drivers/media/radio/wl128x/Kconfig            |   2 +-
 drivers/media/usb/dvb-usb-v2/Kconfig          |   2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c          |   2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |   4 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.h        |   2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c       |   2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.h       |   2 +-
 drivers/media/usb/dvb-usb/Kconfig             |   2 +-
 drivers/media/usb/dvb-usb/a800.c              |   2 +-
 drivers/media/usb/dvb-usb/af9005-fe.c         |   2 +-
 drivers/media/usb/dvb-usb/af9005-remote.c     |   2 +-
 drivers/media/usb/dvb-usb/af9005.c            |   2 +-
 drivers/media/usb/dvb-usb/af9005.h            |   2 +-
 drivers/media/usb/dvb-usb/az6027.c            |   2 +-
 drivers/media/usb/dvb-usb/cxusb.c             |   2 +-
 drivers/media/usb/dvb-usb/dibusb-common.c     |   2 +-
 drivers/media/usb/dvb-usb/dibusb-mb.c         |   2 +-
 drivers/media/usb/dvb-usb/dibusb-mc-common.c  |   2 +-
 drivers/media/usb/dvb-usb/dibusb-mc.c         |   2 +-
 drivers/media/usb/dvb-usb/dibusb.h            |   2 +-
 drivers/media/usb/dvb-usb/digitv.c            |   2 +-
 drivers/media/usb/dvb-usb/dtt200u-fe.c        |   2 +-
 drivers/media/usb/dvb-usb/dtt200u.c           |   2 +-
 drivers/media/usb/dvb-usb/dtt200u.h           |   2 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c      |   2 +-
 drivers/media/usb/dvb-usb/dw2102.c            |   2 +-
 drivers/media/usb/dvb-usb/gp8psk.c            |   2 +-
 drivers/media/usb/dvb-usb/gp8psk.h            |   2 +-
 drivers/media/usb/dvb-usb/m920x.c             |   2 +-
 drivers/media/usb/dvb-usb/nova-t-usb2.c       |   2 +-
 drivers/media/usb/dvb-usb/opera1.c            |   2 +-
 drivers/media/usb/dvb-usb/ttusb2.c            |   2 +-
 drivers/media/usb/dvb-usb/ttusb2.h            |   2 +-
 drivers/media/usb/dvb-usb/umt-010.c           |   2 +-
 drivers/media/usb/dvb-usb/vp702x-fe.c         |   2 +-
 drivers/media/usb/dvb-usb/vp702x.c            |   2 +-
 drivers/media/usb/dvb-usb/vp7045-fe.c         |   2 +-
 drivers/media/usb/dvb-usb/vp7045.c            |   2 +-
 drivers/media/usb/dvb-usb/vp7045.h            |   2 +-
 drivers/media/usb/gspca/Kconfig               |   2 +-
 drivers/media/usb/zr364xx/Kconfig             |   2 +-
 .../staging/media/soc_camera}/soc-camera.rst  |   0
 633 files changed, 1639 insertions(+), 1458 deletions(-)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/au0828-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/avermedia.rst (99%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/bt8xx.rst (93%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/bttv-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/bttv.rst (90%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cafe_ccic.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/cards.rst (100%)
 create mode 100644 Documentation/admin-guide/media/ci.rst
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cpia2.rst (68%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cx23885-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cx88-cardlist.rst (100%)
 create mode 100644 Documentation/admin-guide/media/cx88.rst
 rename Documentation/{media/v4l-drivers => admin-guide/media}/davinci-vpbe.rst (72%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/em28xx-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/faq.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/fimc.rst (91%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/gspca-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/imx.rst (87%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/imx7.rst (100%)
 create mode 100644 Documentation/admin-guide/media/index.rst
 rename Documentation/{media/dvb-drivers => admin-guide/media}/intro.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ipu3.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ipu3_rcb.svg (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ivtv-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ivtv.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/lmedm04.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/meye.rst (63%)
 create mode 100644 Documentation/admin-guide/media/omap3isp.rst
 rename Documentation/{media/v4l-drivers => admin-guide/media}/omap4_camera.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/opera-firmware.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/philips.rst (100%)
 rename Documentation/{media/cec-drivers => admin-guide/media}/pulse8-cec.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/qcom_camss.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/qcom_camss_8x96_graph.dot (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/qcom_camss_graph.dot (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/rcar-fdp1.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/saa7134-cardlist.rst (100%)
 create mode 100644 Documentation/admin-guide/media/saa7134.rst
 rename Documentation/{media/v4l-drivers => admin-guide/media}/saa7164-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/si470x.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/si4713.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/si476x.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/technisat.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/tm6000-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/ttusb-dec.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/tuner-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/udev.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/usbvision-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/v4l-with-ir.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/vimc.dot (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/vimc.rst (92%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/vivid.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/zr364xx.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/cec-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/csi2.rst (100%)
 create mode 100644 Documentation/driver-api/media/drivers/bttv-devel.rst
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/contributors.rst (100%)
 create mode 100644 Documentation/driver-api/media/drivers/cpia2_devel.rst
 rename Documentation/{media/v4l-drivers/cx2341x.rst => driver-api/media/drivers/cx2341x-devel.rst} (91%)
 rename Documentation/{media/v4l-drivers/cx88.rst => driver-api/media/drivers/cx88-devel.rst} (66%)
 create mode 100644 Documentation/driver-api/media/drivers/davinci-vpbe-devel.rst
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/dvb-usb.rst (100%)
 create mode 100644 Documentation/driver-api/media/drivers/fimc-devel.rst
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/frontends.rst (100%)
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/index.rst (67%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/pvrusb2.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/pxa_camera.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/radiotrack.rst (100%)
 rename Documentation/{media/v4l-drivers/saa7134.rst => driver-api/media/drivers/saa7134-devel.rst} (56%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/sh_mobile_ceu_camera.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/tuners.rst (100%)
 create mode 100644 Documentation/driver-api/media/drivers/vimc-devel.rst
 rename Documentation/{media/kapi => driver-api/media}/dtv-ca.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-common.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-demux.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-frontend.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-net.rst (100%)
 rename Documentation/{media/media_kapi.rst => driver-api/media/index.rst} (89%)
 rename Documentation/{media/kapi => driver-api/media}/mc-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/rc-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-async.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-clocks.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-common.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-controls.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-dev.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-device.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-dv-timings.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-event.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-fh.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-flash-led-class.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-fwnode.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-intro.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mc.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mediabus.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mem2mem.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-rect.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-subdev.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-tuner.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-tveeprom.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-videobuf.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-videobuf2.rst (100%)
 delete mode 100644 Documentation/media/cec-drivers/index.rst
 delete mode 100644 Documentation/media/index.rst
 rename Documentation/{ => userspace-api}/media/Makefile (97%)
 rename Documentation/{ => userspace-api}/media/audio.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/ca.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/cec.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-api.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-open.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-poll.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-funcs.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-intro.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-caps.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-conn-info.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-log-addrs.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-phys-addr.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-dqevent.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-g-mode.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-receive.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-pin-error-inj.rst (99%)
 rename Documentation/{ => userspace-api}/media/conf_nitpick.py (100%)
 rename Documentation/{ => userspace-api}/media/dmx.h.rst.exceptions (100%)
 create mode 100644 Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
 create mode 100644 Documentation/userspace-api/media/drivers/imx-uapi.rst
 rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/index.rst (73%)
 rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/max2175.rst (96%)
 create mode 100644 Documentation/userspace-api/media/drivers/meye-uapi.rst
 rename Documentation/{media/v4l-drivers/omap3isp.rst => userspace-api/media/drivers/omap3isp-uapi.rst} (77%)
 rename Documentation/{media/v4l-drivers => userspace-api/media/drivers}/uvcvideo.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-bilingual-channel-select.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-channel-select.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-clear-buffer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-continue.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-fclose.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-fwrite.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-get-capabilities.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-get-status.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-pause.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-play.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-select-source.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-av-sync.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-bypass-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-id.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-mixer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-mute.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-streamtype.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-stop.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio_data_types.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio_function_calls.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-fclose.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-cap.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-descr-info.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-msg.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-slot-info.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-reset.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-send-msg.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-set-descr.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_data_types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_function_calls.rst (92%)
 rename Documentation/{media/dvb-drivers/ci.rst => userspace-api/media/dvb/ca_high_level.rst} (68%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/demux.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-add-pid.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-expbuf.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fclose.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fread.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fwrite.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-get-pes-pids.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-get-stc.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-mmap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-munmap.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-qbuf.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-querybuf.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-remove-pid.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-reqbufs.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-set-buffer-size.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-set-filter.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-set-pes-filter.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-start.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-stop.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx_fcalls.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx_types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvb-fe-read-status.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvb-frontend-event.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvb-frontend-parameters.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvbapi.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvbproperty.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvbstb.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/examples.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-bandwidth-t.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-recv-slave-reply.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-reset-overload.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-send-burst.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-send-master-cmd.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-dishnetwork-send-legacy-cmd.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-enable-high-lnb-voltage.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-event.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-frontend.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-info.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-property.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-ber.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-signal-strength.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-snr.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-status.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-uncorrected-blocks.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-frontend-tune-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-frontend.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-tone.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-voltage.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-type-t.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe_property_parameters.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-property-cable-systems.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-property-satellite-systems.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-property-terrestrial-systems.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-stat-properties.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_f_close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_f_open.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_fcalls.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_legacy_api.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_legacy_dvbv3_api.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/headers.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/intro.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/legacy_dvb_apis.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-add-if.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-get-if.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-remove-if.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/query-dvb-frontend-info.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-clear-buffer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-command.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-continue.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fast-forward.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fclose.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-freeze.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fwrite.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-capabilities.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-event.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-frame-count.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-pts.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-size.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-status.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-play.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-select-source.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-blank.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-display-format.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-format.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-streamtype.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-slowmotion.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-stillpicture.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-stop.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-try-command.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video_function_calls.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video_types.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/fdl-appendix.rst (99%)
 rename Documentation/{ => userspace-api}/media/frontend.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/gen-errors.rst (98%)
 rename Documentation/{media/media_uapi.rst => userspace-api/media/index.rst} (80%)
 rename Documentation/{ => userspace-api}/media/intro.rst (100%)
 rename Documentation/{ => userspace-api}/media/lirc.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/media.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-controller-intro.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-controller-model.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-controller.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-func-close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-func-open.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-funcs.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-device-info.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-enum-entities.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-enum-links.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-g-topology.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-request-alloc.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-setup-link.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-request-ioc-queue.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-request-ioc-reinit.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-types.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-api.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-func-close.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-func-poll.rst (98%)
 rename Documentation/{ => userspace-api}/media/net.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/keytable.c.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-dev-intro.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-dev.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-func.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-features.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-rec-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-rec-resolution.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-send-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-timeout.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-read.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-measure-carrier-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-carrier-range.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-carrier.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-timeout-reports.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-timeout.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-send-carrier.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-send-duty-cycle.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-transmitter-mask.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-wideband-receiver.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-write.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-intro.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-protos.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-sysfs-nodes.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-table-change.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-tables.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/remote_controllers.rst (95%)
 rename Documentation/{ => userspace-api}/media/typical_media_device.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/app-pri.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/async.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/audio.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/bayer.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/biblio.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/buffer.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/capture-example.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/capture.c.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/colorspaces-defs.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/colorspaces-details.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/colorspaces.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/common-defs.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/common.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/compat.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/constraints.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/control.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/crop.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/crop.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/depth-formats.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-capture.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-decoder.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-event.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-mem2mem.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-meta.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-osd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-output.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-overlay.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-radio.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-raw-vbi.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-rds.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-sdr.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-sliced-vbi.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-stateless-decoder.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-subdev.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-touch.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/devices.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/diff-v4l.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dmabuf.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dv-timings.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-camera.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-codec.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-detect.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-dv.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-flash.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-fm-rx.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-fm-tx.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-image-process.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-image-source.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-jpeg.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-rf-tuner.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/extended-controls.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/field-order.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/fieldseq_bt.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/fieldseq_tb.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/format.rst (98%)
 rename Documentation/{media/v4l-drivers => userspace-api/media/v4l}/fourcc.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-mmap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-munmap.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-open.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-poll.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-read.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-select.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-write.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/hist-v4l2.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/hsv-formats.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/io.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/libv4l-introduction.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/libv4l.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/meta-formats.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/mmap.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/nv12mt.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/nv12mt_example.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/open.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pipeline.dot (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-bayer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-cnf4.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-compressed.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-grey.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-indexed.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-intro.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-inzi.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-m420.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-d4xx.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-intel-ipu3.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-uvc.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-vivid.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-vsp1-hgo.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-vsp1-hgt.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv12.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv12m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv12mt.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv16.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv16m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv24.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-packed-hsv.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-packed-yuv.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-reserved.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-rgb.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cs08.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cs14le.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cu08.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cu16le.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-pcu16be.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-pcu18be.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-pcu20be.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-ru12le.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10-ipu3.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10alaw8.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10dpcm8.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb12.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb12p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb14p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb8.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-td08.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-td16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-tu08.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-tu16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-uv8.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-uyvy.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-v4l2-mplane.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-v4l2.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-vyuy.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y10.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y10b.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y10p.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y12.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y12i.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y16-be.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y41p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y8i.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv410.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv411p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv420.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv420m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv422m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv422p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv444m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuyv.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yvyu.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-z16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/planar-apis.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/querycap.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/rw.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/sdr-formats.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-configuration.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-examples.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-intro.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-targets.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-vs-crop-api.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selections-common.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/standard.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/streaming-par.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-formats.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-image-processing-crop.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-image-processing-full.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-image-processing-scaling-multi-source.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/tch-formats.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/tuner.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/user-func.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/userp.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2-selection-flags.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2-selection-targets.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2grab-example.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2grab.c.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vbi_525.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vbi_625.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vbi_hsync.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/video.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/videodev.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-create-bufs.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-cropcap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dbg-g-chip-info.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dbg-g-register.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-decoder-cmd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dqevent.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dv-timings-cap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-encoder-cmd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-dv-timings.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-fmt.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-frameintervals.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-framesizes.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-freq-bands.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumaudio.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumaudioout.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enuminput.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumoutput.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumstd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-expbuf.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-audio.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-audioout.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-crop.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-ctrl.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-dv-timings.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-edid.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-enc-index.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-ext-ctrls.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-fbuf.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-fmt.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-frequency.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-input.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-jpegcomp.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-modulator.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-output.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-parm.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-priority.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-selection.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-sliced-vbi-cap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-std.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-tuner.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-log-status.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-overlay.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-prepare-buf.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-qbuf.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-query-dv-timings.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-querybuf.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-querycap.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-queryctrl.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-querystd.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-reqbufs.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-s-hw-freq-seek.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-streamon.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-enum-frame-interval.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-enum-frame-size.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-enum-mbus-code.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-crop.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-fmt.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-frame-interval.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-selection.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subscribe-event.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/yuv-formats.rst (97%)
 rename Documentation/{ => userspace-api}/media/video.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/videodev2.h.rst.exceptions (100%)
 rename {Documentation/media/v4l-drivers => drivers/staging/media/soc_camera}/soc-camera.rst (100%)

-- 
2.24.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
