Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB4180C8A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8800F6E8FD;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C3A89BF1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:43:19 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de
 [95.90.212.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 856AF246B2;
 Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583847798;
 bh=13vaRQN2BNv+Dygaau0KZqhHGvksKq1hTpmOfBc0AlM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nfSlp1Kz9Wi3Ushp4huDPvAyZOQ+uH45d47/4RhhsfNEEgOTWwY9/klVG9NOeVdFA
 HnlaslRCI2XJjha5F5vZSglL3Q+q9gz2cLAcR21nI2dv1RZ4LGO0TNS66mEYg1Nj5Q
 5ilfO7+CsjyvvKFBEwDMYvstpQMe5cvG0iAldiW8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jBfAB-0005wS-Gh; Tue, 10 Mar 2020 14:43:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 16/22] media: docs: move uAPI book to userspace-api/media
Date: Tue, 10 Mar 2020 14:43:07 +0100
Message-Id: <d24d0a4df013d1ef53f8c33a23dc7183b4fb76cd.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Bingbu Cao <bingbu.cao@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Tian Shu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 2017, there is an space reserved for userspace API,
created by changeset 1d596dee3862 ("docs: Create a user-space API guide").

As the media subsystem was one of the first subsystems to use
Sphinx, until this patch, we were keeping things on a separate
place.

Let's just use the new location, as having all uAPI altogether
will likely make things easier for developers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/debugfs-cec-error-inj    |  2 +-
 Documentation/Makefile                             | 10 +++++-----
 Documentation/doc-guide/parse-headers.rst          |  2 +-
 Documentation/fb/api.rst                           |  4 ++--
 Documentation/media/index.rst                      |  2 +-
 .../translations/it_IT/doc-guide/parse-headers.rst |  2 +-
 Documentation/{ => userspace-api}/media/Makefile   |  2 +-
 .../media/audio.h.rst.exceptions                   |  0
 .../{ => userspace-api}/media/ca.h.rst.exceptions  |  0
 .../{ => userspace-api}/media/cec.h.rst.exceptions |  0
 .../uapi => userspace-api/media}/cec/cec-api.rst   |  2 +-
 .../media}/cec/cec-func-close.rst                  |  2 +-
 .../media}/cec/cec-func-ioctl.rst                  |  2 +-
 .../media}/cec/cec-func-open.rst                   |  2 +-
 .../media}/cec/cec-func-poll.rst                   |  2 +-
 .../uapi => userspace-api/media}/cec/cec-funcs.rst |  2 +-
 .../media}/cec/cec-header.rst                      |  2 +-
 .../uapi => userspace-api/media}/cec/cec-intro.rst |  2 +-
 .../media}/cec/cec-ioc-adap-g-caps.rst             |  2 +-
 .../media}/cec/cec-ioc-adap-g-conn-info.rst        |  0
 .../media}/cec/cec-ioc-adap-g-log-addrs.rst        |  2 +-
 .../media}/cec/cec-ioc-adap-g-phys-addr.rst        |  2 +-
 .../media}/cec/cec-ioc-dqevent.rst                 |  2 +-
 .../media}/cec/cec-ioc-g-mode.rst                  |  2 +-
 .../media}/cec/cec-ioc-receive.rst                 |  2 +-
 .../media}/cec/cec-pin-error-inj.rst               |  2 +-
 .../{ => userspace-api}/media/conf_nitpick.py      |  0
 .../{ => userspace-api}/media/dmx.h.rst.exceptions |  0
 .../media}/dvb/audio-bilingual-channel-select.rst  |  2 +-
 .../media}/dvb/audio-channel-select.rst            |  2 +-
 .../media}/dvb/audio-clear-buffer.rst              |  2 +-
 .../media}/dvb/audio-continue.rst                  |  2 +-
 .../media}/dvb/audio-fclose.rst                    |  2 +-
 .../media}/dvb/audio-fopen.rst                     |  2 +-
 .../media}/dvb/audio-fwrite.rst                    |  2 +-
 .../media}/dvb/audio-get-capabilities.rst          |  2 +-
 .../media}/dvb/audio-get-status.rst                |  2 +-
 .../media}/dvb/audio-pause.rst                     |  2 +-
 .../media}/dvb/audio-play.rst                      |  2 +-
 .../media}/dvb/audio-select-source.rst             |  2 +-
 .../media}/dvb/audio-set-av-sync.rst               |  2 +-
 .../media}/dvb/audio-set-bypass-mode.rst           |  2 +-
 .../media}/dvb/audio-set-id.rst                    |  2 +-
 .../media}/dvb/audio-set-mixer.rst                 |  2 +-
 .../media}/dvb/audio-set-mute.rst                  |  2 +-
 .../media}/dvb/audio-set-streamtype.rst            |  2 +-
 .../media}/dvb/audio-stop.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/audio.rst     |  2 +-
 .../media}/dvb/audio_data_types.rst                |  2 +-
 .../media}/dvb/audio_function_calls.rst            |  2 +-
 .../uapi => userspace-api/media}/dvb/ca-fclose.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/ca-fopen.rst  |  2 +-
 .../media}/dvb/ca-get-cap.rst                      |  2 +-
 .../media}/dvb/ca-get-descr-info.rst               |  2 +-
 .../media}/dvb/ca-get-msg.rst                      |  2 +-
 .../media}/dvb/ca-get-slot-info.rst                |  2 +-
 .../uapi => userspace-api/media}/dvb/ca-reset.rst  |  2 +-
 .../media}/dvb/ca-send-msg.rst                     |  2 +-
 .../media}/dvb/ca-set-descr.rst                    |  2 +-
 .../{media/uapi => userspace-api/media}/dvb/ca.rst |  2 +-
 .../media}/dvb/ca_data_types.rst                   |  2 +-
 .../media}/dvb/ca_function_calls.rst               |  2 +-
 .../media}/dvb/ca_high_level.rst                   |  0
 .../uapi => userspace-api/media}/dvb/demux.rst     |  2 +-
 .../media}/dvb/dmx-add-pid.rst                     |  2 +-
 .../media}/dvb/dmx-expbuf.rst                      |  2 +-
 .../media}/dvb/dmx-fclose.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-fopen.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-fread.rst |  2 +-
 .../media}/dvb/dmx-fwrite.rst                      |  2 +-
 .../media}/dvb/dmx-get-pes-pids.rst                |  2 +-
 .../media}/dvb/dmx-get-stc.rst                     |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-mmap.rst  |  2 +-
 .../media}/dvb/dmx-munmap.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-qbuf.rst  |  2 +-
 .../media}/dvb/dmx-querybuf.rst                    |  2 +-
 .../media}/dvb/dmx-remove-pid.rst                  |  2 +-
 .../media}/dvb/dmx-reqbufs.rst                     |  2 +-
 .../media}/dvb/dmx-set-buffer-size.rst             |  2 +-
 .../media}/dvb/dmx-set-filter.rst                  |  2 +-
 .../media}/dvb/dmx-set-pes-filter.rst              |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-start.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-stop.rst  |  2 +-
 .../media}/dvb/dmx_fcalls.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx_types.rst |  2 +-
 .../media}/dvb/dvb-fe-read-status.rst              |  2 +-
 .../media}/dvb/dvb-frontend-event.rst              |  2 +-
 .../media}/dvb/dvb-frontend-parameters.rst         |  2 +-
 .../uapi => userspace-api/media}/dvb/dvbapi.rst    |  2 +-
 .../media}/dvb/dvbproperty.rst                     |  2 +-
 .../uapi => userspace-api/media}/dvb/dvbstb.svg    |  2 +-
 .../uapi => userspace-api/media}/dvb/examples.rst  |  2 +-
 .../media}/dvb/fe-bandwidth-t.rst                  |  2 +-
 .../media}/dvb/fe-diseqc-recv-slave-reply.rst      |  2 +-
 .../media}/dvb/fe-diseqc-reset-overload.rst        |  2 +-
 .../media}/dvb/fe-diseqc-send-burst.rst            |  2 +-
 .../media}/dvb/fe-diseqc-send-master-cmd.rst       |  2 +-
 .../media}/dvb/fe-dishnetwork-send-legacy-cmd.rst  |  2 +-
 .../media}/dvb/fe-enable-high-lnb-voltage.rst      |  2 +-
 .../media}/dvb/fe-get-event.rst                    |  2 +-
 .../media}/dvb/fe-get-frontend.rst                 |  2 +-
 .../media}/dvb/fe-get-info.rst                     |  2 +-
 .../media}/dvb/fe-get-property.rst                 |  2 +-
 .../media}/dvb/fe-read-ber.rst                     |  2 +-
 .../media}/dvb/fe-read-signal-strength.rst         |  2 +-
 .../media}/dvb/fe-read-snr.rst                     |  2 +-
 .../media}/dvb/fe-read-status.rst                  |  2 +-
 .../media}/dvb/fe-read-uncorrected-blocks.rst      |  2 +-
 .../media}/dvb/fe-set-frontend-tune-mode.rst       |  2 +-
 .../media}/dvb/fe-set-frontend.rst                 |  2 +-
 .../media}/dvb/fe-set-tone.rst                     |  2 +-
 .../media}/dvb/fe-set-voltage.rst                  |  2 +-
 .../uapi => userspace-api/media}/dvb/fe-type-t.rst |  2 +-
 .../media}/dvb/fe_property_parameters.rst          |  2 +-
 .../media}/dvb/frontend-header.rst                 |  2 +-
 .../media}/dvb/frontend-property-cable-systems.rst |  2 +-
 .../dvb/frontend-property-satellite-systems.rst    |  2 +-
 .../dvb/frontend-property-terrestrial-systems.rst  |  2 +-
 .../media}/dvb/frontend-stat-properties.rst        |  2 +-
 .../uapi => userspace-api/media}/dvb/frontend.rst  |  2 +-
 .../media}/dvb/frontend_f_close.rst                |  2 +-
 .../media}/dvb/frontend_f_open.rst                 |  2 +-
 .../media}/dvb/frontend_fcalls.rst                 |  2 +-
 .../media}/dvb/frontend_legacy_api.rst             |  2 +-
 .../media}/dvb/frontend_legacy_dvbv3_api.rst       |  2 +-
 .../uapi => userspace-api/media}/dvb/headers.rst   |  2 +-
 .../uapi => userspace-api/media}/dvb/intro.rst     |  2 +-
 .../media}/dvb/legacy_dvb_apis.rst                 |  2 +-
 .../media}/dvb/net-add-if.rst                      |  2 +-
 .../media}/dvb/net-get-if.rst                      |  2 +-
 .../media}/dvb/net-remove-if.rst                   |  2 +-
 .../uapi => userspace-api/media}/dvb/net-types.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/net.rst       |  2 +-
 .../media}/dvb/query-dvb-frontend-info.rst         |  2 +-
 .../media}/dvb/video-clear-buffer.rst              |  2 +-
 .../media}/dvb/video-command.rst                   |  2 +-
 .../media}/dvb/video-continue.rst                  |  2 +-
 .../media}/dvb/video-fast-forward.rst              |  2 +-
 .../media}/dvb/video-fclose.rst                    |  2 +-
 .../media}/dvb/video-fopen.rst                     |  2 +-
 .../media}/dvb/video-freeze.rst                    |  2 +-
 .../media}/dvb/video-fwrite.rst                    |  2 +-
 .../media}/dvb/video-get-capabilities.rst          |  2 +-
 .../media}/dvb/video-get-event.rst                 |  2 +-
 .../media}/dvb/video-get-frame-count.rst           |  2 +-
 .../media}/dvb/video-get-pts.rst                   |  2 +-
 .../media}/dvb/video-get-size.rst                  |  2 +-
 .../media}/dvb/video-get-status.rst                |  2 +-
 .../media}/dvb/video-play.rst                      |  2 +-
 .../media}/dvb/video-select-source.rst             |  2 +-
 .../media}/dvb/video-set-blank.rst                 |  2 +-
 .../media}/dvb/video-set-display-format.rst        |  2 +-
 .../media}/dvb/video-set-format.rst                |  2 +-
 .../media}/dvb/video-set-streamtype.rst            |  2 +-
 .../media}/dvb/video-slowmotion.rst                |  2 +-
 .../media}/dvb/video-stillpicture.rst              |  2 +-
 .../media}/dvb/video-stop.rst                      |  2 +-
 .../media}/dvb/video-try-command.rst               |  2 +-
 .../uapi => userspace-api/media}/dvb/video.rst     |  2 +-
 .../media}/dvb/video_function_calls.rst            |  2 +-
 .../media}/dvb/video_types.rst                     |  2 +-
 .../uapi => userspace-api/media}/fdl-appendix.rst  |  2 +-
 .../media/frontend.h.rst.exceptions                |  0
 .../uapi => userspace-api/media}/gen-errors.rst    |  2 +-
 .../media/index.rst}                               | 14 +++++++-------
 Documentation/{ => userspace-api}/media/intro.rst  |  0
 .../media/lirc.h.rst.exceptions                    |  0
 .../media/media.h.rst.exceptions                   |  0
 .../media}/mediactl/media-controller-intro.rst     |  2 +-
 .../media}/mediactl/media-controller-model.rst     |  2 +-
 .../media}/mediactl/media-controller.rst           |  2 +-
 .../media}/mediactl/media-func-close.rst           |  2 +-
 .../media}/mediactl/media-func-ioctl.rst           |  2 +-
 .../media}/mediactl/media-func-open.rst            |  2 +-
 .../media}/mediactl/media-funcs.rst                |  2 +-
 .../media}/mediactl/media-header.rst               |  2 +-
 .../media}/mediactl/media-ioc-device-info.rst      |  2 +-
 .../media}/mediactl/media-ioc-enum-entities.rst    |  2 +-
 .../media}/mediactl/media-ioc-enum-links.rst       |  2 +-
 .../media}/mediactl/media-ioc-g-topology.rst       |  2 +-
 .../media}/mediactl/media-ioc-request-alloc.rst    |  2 +-
 .../media}/mediactl/media-ioc-setup-link.rst       |  2 +-
 .../media}/mediactl/media-request-ioc-queue.rst    |  2 +-
 .../media}/mediactl/media-request-ioc-reinit.rst   |  2 +-
 .../media}/mediactl/media-types.rst                |  2 +-
 .../media}/mediactl/request-api.rst                |  2 +-
 .../media}/mediactl/request-func-close.rst         |  2 +-
 .../media}/mediactl/request-func-ioctl.rst         |  2 +-
 .../media}/mediactl/request-func-poll.rst          |  2 +-
 .../{ => userspace-api}/media/net.h.rst.exceptions |  0
 .../uapi => userspace-api/media}/rc/keytable.c.rst |  2 +-
 .../media}/rc/lirc-dev-intro.rst                   |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-dev.rst   |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-func.rst  |  2 +-
 .../media}/rc/lirc-get-features.rst                |  2 +-
 .../media}/rc/lirc-get-rec-mode.rst                |  2 +-
 .../media}/rc/lirc-get-rec-resolution.rst          |  2 +-
 .../media}/rc/lirc-get-send-mode.rst               |  2 +-
 .../media}/rc/lirc-get-timeout.rst                 |  2 +-
 .../media}/rc/lirc-header.rst                      |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-read.rst  |  2 +-
 .../media}/rc/lirc-set-measure-carrier-mode.rst    |  2 +-
 .../media}/rc/lirc-set-rec-carrier-range.rst       |  2 +-
 .../media}/rc/lirc-set-rec-carrier.rst             |  2 +-
 .../media}/rc/lirc-set-rec-timeout-reports.rst     |  2 +-
 .../media}/rc/lirc-set-rec-timeout.rst             |  2 +-
 .../media}/rc/lirc-set-send-carrier.rst            |  2 +-
 .../media}/rc/lirc-set-send-duty-cycle.rst         |  2 +-
 .../media}/rc/lirc-set-transmitter-mask.rst        |  2 +-
 .../media}/rc/lirc-set-wideband-receiver.rst       |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-write.rst |  2 +-
 .../uapi => userspace-api/media}/rc/rc-intro.rst   |  2 +-
 .../uapi => userspace-api/media}/rc/rc-protos.rst  |  0
 .../media}/rc/rc-sysfs-nodes.rst                   |  2 +-
 .../media}/rc/rc-table-change.rst                  |  2 +-
 .../uapi => userspace-api/media}/rc/rc-tables.rst  |  2 +-
 .../media}/rc/remote_controllers.rst               |  2 +-
 .../media/typical_media_device.svg                 |  2 +-
 .../uapi => userspace-api/media}/v4l/app-pri.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/async.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/audio.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/bayer.svg     |  2 +-
 .../uapi => userspace-api/media}/v4l/biblio.rst    |  2 +-
 .../uapi => userspace-api/media}/v4l/buffer.rst    |  2 +-
 .../media}/v4l/capture-example.rst                 |  2 +-
 .../uapi => userspace-api/media}/v4l/capture.c.rst |  2 +-
 .../media}/v4l/colorspaces-defs.rst                |  2 +-
 .../media}/v4l/colorspaces-details.rst             |  2 +-
 .../media}/v4l/colorspaces.rst                     |  2 +-
 .../media}/v4l/common-defs.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/common.rst    |  2 +-
 .../uapi => userspace-api/media}/v4l/compat.rst    |  2 +-
 .../media}/v4l/constraints.svg                     |  2 +-
 .../uapi => userspace-api/media}/v4l/control.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/crop.rst      |  2 +-
 .../uapi => userspace-api/media}/v4l/crop.svg      |  2 +-
 .../media}/v4l/depth-formats.rst                   |  2 +-
 .../media}/v4l/dev-capture.rst                     |  2 +-
 .../media}/v4l/dev-decoder.rst                     |  0
 .../uapi => userspace-api/media}/v4l/dev-event.rst |  2 +-
 .../media}/v4l/dev-mem2mem.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-meta.rst  |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-osd.rst   |  2 +-
 .../media}/v4l/dev-output.rst                      |  2 +-
 .../media}/v4l/dev-overlay.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-radio.rst |  2 +-
 .../media}/v4l/dev-raw-vbi.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-rds.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-sdr.rst   |  2 +-
 .../media}/v4l/dev-sliced-vbi.rst                  |  2 +-
 .../media}/v4l/dev-stateless-decoder.rst           |  0
 .../media}/v4l/dev-subdev.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-touch.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/devices.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/diff-v4l.rst  |  2 +-
 .../uapi => userspace-api/media}/v4l/dmabuf.rst    |  2 +-
 .../media}/v4l/dv-timings.rst                      |  2 +-
 .../media}/v4l/ext-ctrls-camera.rst                |  2 +-
 .../media}/v4l/ext-ctrls-codec.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-detect.rst                |  2 +-
 .../media}/v4l/ext-ctrls-dv.rst                    |  2 +-
 .../media}/v4l/ext-ctrls-flash.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-fm-rx.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-fm-tx.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-image-process.rst         |  2 +-
 .../media}/v4l/ext-ctrls-image-source.rst          |  2 +-
 .../media}/v4l/ext-ctrls-jpeg.rst                  |  2 +-
 .../media}/v4l/ext-ctrls-rf-tuner.rst              |  2 +-
 .../media}/v4l/extended-controls.rst               |  2 +-
 .../media}/v4l/field-order.rst                     |  2 +-
 .../media}/v4l/fieldseq_bt.svg                     |  2 +-
 .../media}/v4l/fieldseq_tb.svg                     |  2 +-
 .../uapi => userspace-api/media}/v4l/format.rst    |  2 +-
 .../media}/v4l/func-close.rst                      |  2 +-
 .../media}/v4l/func-ioctl.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/func-mmap.rst |  2 +-
 .../media}/v4l/func-munmap.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/func-open.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/func-poll.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/func-read.rst |  2 +-
 .../media}/v4l/func-select.rst                     |  2 +-
 .../media}/v4l/func-write.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/hist-v4l2.rst |  2 +-
 .../media}/v4l/hsv-formats.rst                     |  2 +-
 .../{media/uapi => userspace-api/media}/v4l/io.rst |  2 +-
 .../media}/v4l/libv4l-introduction.rst             |  2 +-
 .../uapi => userspace-api/media}/v4l/libv4l.rst    |  2 +-
 .../media}/v4l/meta-formats.rst                    |  2 +-
 .../uapi => userspace-api/media}/v4l/mmap.rst      |  2 +-
 .../uapi => userspace-api/media}/v4l/nv12mt.svg    |  2 +-
 .../media}/v4l/nv12mt_example.svg                  |  2 +-
 .../uapi => userspace-api/media}/v4l/open.rst      |  2 +-
 .../uapi => userspace-api/media}/v4l/pipeline.dot  |  0
 .../media}/v4l/pixfmt-bayer.rst                    |  2 +-
 .../media}/v4l/pixfmt-cnf4.rst                     |  0
 .../media}/v4l/pixfmt-compressed.rst               |  2 +-
 .../media}/v4l/pixfmt-grey.rst                     |  2 +-
 .../media}/v4l/pixfmt-indexed.rst                  |  2 +-
 .../media}/v4l/pixfmt-intro.rst                    |  2 +-
 .../media}/v4l/pixfmt-inzi.rst                     |  2 +-
 .../media}/v4l/pixfmt-m420.rst                     |  2 +-
 .../media}/v4l/pixfmt-meta-d4xx.rst                |  2 +-
 .../media}/v4l/pixfmt-meta-intel-ipu3.rst          |  2 +-
 .../media}/v4l/pixfmt-meta-uvc.rst                 |  2 +-
 .../media}/v4l/pixfmt-meta-vivid.rst               |  2 +-
 .../media}/v4l/pixfmt-meta-vsp1-hgo.rst            |  2 +-
 .../media}/v4l/pixfmt-meta-vsp1-hgt.rst            |  2 +-
 .../media}/v4l/pixfmt-nv12.rst                     |  2 +-
 .../media}/v4l/pixfmt-nv12m.rst                    |  2 +-
 .../media}/v4l/pixfmt-nv12mt.rst                   |  2 +-
 .../media}/v4l/pixfmt-nv16.rst                     |  2 +-
 .../media}/v4l/pixfmt-nv16m.rst                    |  2 +-
 .../media}/v4l/pixfmt-nv24.rst                     |  2 +-
 .../media}/v4l/pixfmt-packed-hsv.rst               |  2 +-
 .../media}/v4l/pixfmt-packed-yuv.rst               |  2 +-
 .../media}/v4l/pixfmt-reserved.rst                 |  2 +-
 .../media}/v4l/pixfmt-rgb.rst                      |  2 +-
 .../media}/v4l/pixfmt-sdr-cs08.rst                 |  2 +-
 .../media}/v4l/pixfmt-sdr-cs14le.rst               |  2 +-
 .../media}/v4l/pixfmt-sdr-cu08.rst                 |  2 +-
 .../media}/v4l/pixfmt-sdr-cu16le.rst               |  2 +-
 .../media}/v4l/pixfmt-sdr-pcu16be.rst              |  2 +-
 .../media}/v4l/pixfmt-sdr-pcu18be.rst              |  2 +-
 .../media}/v4l/pixfmt-sdr-pcu20be.rst              |  2 +-
 .../media}/v4l/pixfmt-sdr-ru12le.rst               |  2 +-
 .../media}/v4l/pixfmt-srggb10-ipu3.rst             |  2 +-
 .../media}/v4l/pixfmt-srggb10.rst                  |  2 +-
 .../media}/v4l/pixfmt-srggb10alaw8.rst             |  2 +-
 .../media}/v4l/pixfmt-srggb10dpcm8.rst             |  2 +-
 .../media}/v4l/pixfmt-srggb10p.rst                 |  2 +-
 .../media}/v4l/pixfmt-srggb12.rst                  |  2 +-
 .../media}/v4l/pixfmt-srggb12p.rst                 |  2 +-
 .../media}/v4l/pixfmt-srggb14p.rst                 |  2 +-
 .../media}/v4l/pixfmt-srggb16.rst                  |  2 +-
 .../media}/v4l/pixfmt-srggb8.rst                   |  2 +-
 .../media}/v4l/pixfmt-tch-td08.rst                 |  2 +-
 .../media}/v4l/pixfmt-tch-td16.rst                 |  2 +-
 .../media}/v4l/pixfmt-tch-tu08.rst                 |  2 +-
 .../media}/v4l/pixfmt-tch-tu16.rst                 |  2 +-
 .../media}/v4l/pixfmt-uv8.rst                      |  2 +-
 .../media}/v4l/pixfmt-uyvy.rst                     |  2 +-
 .../media}/v4l/pixfmt-v4l2-mplane.rst              |  2 +-
 .../media}/v4l/pixfmt-v4l2.rst                     |  2 +-
 .../media}/v4l/pixfmt-vyuy.rst                     |  2 +-
 .../media}/v4l/pixfmt-y10.rst                      |  2 +-
 .../media}/v4l/pixfmt-y10b.rst                     |  2 +-
 .../media}/v4l/pixfmt-y10p.rst                     |  2 +-
 .../media}/v4l/pixfmt-y12.rst                      |  2 +-
 .../media}/v4l/pixfmt-y12i.rst                     |  2 +-
 .../media}/v4l/pixfmt-y16-be.rst                   |  2 +-
 .../media}/v4l/pixfmt-y16.rst                      |  2 +-
 .../media}/v4l/pixfmt-y41p.rst                     |  2 +-
 .../media}/v4l/pixfmt-y8i.rst                      |  2 +-
 .../media}/v4l/pixfmt-yuv410.rst                   |  2 +-
 .../media}/v4l/pixfmt-yuv411p.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv420.rst                   |  2 +-
 .../media}/v4l/pixfmt-yuv420m.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv422m.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv422p.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv444m.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuyv.rst                     |  2 +-
 .../media}/v4l/pixfmt-yvyu.rst                     |  2 +-
 .../media}/v4l/pixfmt-z16.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/pixfmt.rst    |  2 +-
 .../media}/v4l/planar-apis.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/querycap.rst  |  2 +-
 .../{media/uapi => userspace-api/media}/v4l/rw.rst |  2 +-
 .../media}/v4l/sdr-formats.rst                     |  2 +-
 .../media}/v4l/selection-api-configuration.rst     |  2 +-
 .../media}/v4l/selection-api-examples.rst          |  2 +-
 .../media}/v4l/selection-api-intro.rst             |  2 +-
 .../media}/v4l/selection-api-targets.rst           |  2 +-
 .../media}/v4l/selection-api-vs-crop-api.rst       |  2 +-
 .../media}/v4l/selection-api.rst                   |  2 +-
 .../uapi => userspace-api/media}/v4l/selection.svg |  2 +-
 .../media}/v4l/selections-common.rst               |  2 +-
 .../uapi => userspace-api/media}/v4l/standard.rst  |  2 +-
 .../media}/v4l/streaming-par.rst                   |  2 +-
 .../media}/v4l/subdev-formats.rst                  |  2 +-
 .../media}/v4l/subdev-image-processing-crop.svg    |  2 +-
 .../media}/v4l/subdev-image-processing-full.svg    |  2 +-
 ...ubdev-image-processing-scaling-multi-source.svg |  2 +-
 .../media}/v4l/tch-formats.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/tuner.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/user-func.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/userp.rst     |  2 +-
 .../media}/v4l/v4l2-selection-flags.rst            |  2 +-
 .../media}/v4l/v4l2-selection-targets.rst          |  2 +-
 .../uapi => userspace-api/media}/v4l/v4l2.rst      |  2 +-
 .../media}/v4l/v4l2grab-example.rst                |  2 +-
 .../media}/v4l/v4l2grab.c.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/vbi_525.svg   |  2 +-
 .../uapi => userspace-api/media}/v4l/vbi_625.svg   |  2 +-
 .../uapi => userspace-api/media}/v4l/vbi_hsync.svg |  2 +-
 .../uapi => userspace-api/media}/v4l/video.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/videodev.rst  |  2 +-
 .../media}/v4l/vidioc-create-bufs.rst              |  2 +-
 .../media}/v4l/vidioc-cropcap.rst                  |  2 +-
 .../media}/v4l/vidioc-dbg-g-chip-info.rst          |  2 +-
 .../media}/v4l/vidioc-dbg-g-register.rst           |  2 +-
 .../media}/v4l/vidioc-decoder-cmd.rst              |  2 +-
 .../media}/v4l/vidioc-dqevent.rst                  |  2 +-
 .../media}/v4l/vidioc-dv-timings-cap.rst           |  2 +-
 .../media}/v4l/vidioc-encoder-cmd.rst              |  2 +-
 .../media}/v4l/vidioc-enum-dv-timings.rst          |  2 +-
 .../media}/v4l/vidioc-enum-fmt.rst                 |  2 +-
 .../media}/v4l/vidioc-enum-frameintervals.rst      |  2 +-
 .../media}/v4l/vidioc-enum-framesizes.rst          |  2 +-
 .../media}/v4l/vidioc-enum-freq-bands.rst          |  2 +-
 .../media}/v4l/vidioc-enumaudio.rst                |  2 +-
 .../media}/v4l/vidioc-enumaudioout.rst             |  2 +-
 .../media}/v4l/vidioc-enuminput.rst                |  2 +-
 .../media}/v4l/vidioc-enumoutput.rst               |  2 +-
 .../media}/v4l/vidioc-enumstd.rst                  |  2 +-
 .../media}/v4l/vidioc-expbuf.rst                   |  2 +-
 .../media}/v4l/vidioc-g-audio.rst                  |  2 +-
 .../media}/v4l/vidioc-g-audioout.rst               |  2 +-
 .../media}/v4l/vidioc-g-crop.rst                   |  2 +-
 .../media}/v4l/vidioc-g-ctrl.rst                   |  2 +-
 .../media}/v4l/vidioc-g-dv-timings.rst             |  2 +-
 .../media}/v4l/vidioc-g-edid.rst                   |  2 +-
 .../media}/v4l/vidioc-g-enc-index.rst              |  2 +-
 .../media}/v4l/vidioc-g-ext-ctrls.rst              |  2 +-
 .../media}/v4l/vidioc-g-fbuf.rst                   |  2 +-
 .../media}/v4l/vidioc-g-fmt.rst                    |  2 +-
 .../media}/v4l/vidioc-g-frequency.rst              |  2 +-
 .../media}/v4l/vidioc-g-input.rst                  |  2 +-
 .../media}/v4l/vidioc-g-jpegcomp.rst               |  2 +-
 .../media}/v4l/vidioc-g-modulator.rst              |  2 +-
 .../media}/v4l/vidioc-g-output.rst                 |  2 +-
 .../media}/v4l/vidioc-g-parm.rst                   |  2 +-
 .../media}/v4l/vidioc-g-priority.rst               |  2 +-
 .../media}/v4l/vidioc-g-selection.rst              |  2 +-
 .../media}/v4l/vidioc-g-sliced-vbi-cap.rst         |  2 +-
 .../media}/v4l/vidioc-g-std.rst                    |  2 +-
 .../media}/v4l/vidioc-g-tuner.rst                  |  2 +-
 .../media}/v4l/vidioc-log-status.rst               |  2 +-
 .../media}/v4l/vidioc-overlay.rst                  |  2 +-
 .../media}/v4l/vidioc-prepare-buf.rst              |  2 +-
 .../media}/v4l/vidioc-qbuf.rst                     |  2 +-
 .../media}/v4l/vidioc-query-dv-timings.rst         |  2 +-
 .../media}/v4l/vidioc-querybuf.rst                 |  2 +-
 .../media}/v4l/vidioc-querycap.rst                 |  2 +-
 .../media}/v4l/vidioc-queryctrl.rst                |  2 +-
 .../media}/v4l/vidioc-querystd.rst                 |  2 +-
 .../media}/v4l/vidioc-reqbufs.rst                  |  2 +-
 .../media}/v4l/vidioc-s-hw-freq-seek.rst           |  2 +-
 .../media}/v4l/vidioc-streamon.rst                 |  2 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst      |  2 +-
 .../media}/v4l/vidioc-subdev-enum-frame-size.rst   |  2 +-
 .../media}/v4l/vidioc-subdev-enum-mbus-code.rst    |  2 +-
 .../media}/v4l/vidioc-subdev-g-crop.rst            |  2 +-
 .../media}/v4l/vidioc-subdev-g-fmt.rst             |  2 +-
 .../media}/v4l/vidioc-subdev-g-frame-interval.rst  |  2 +-
 .../media}/v4l/vidioc-subdev-g-selection.rst       |  2 +-
 .../media}/v4l/vidioc-subscribe-event.rst          |  2 +-
 .../media}/v4l/yuv-formats.rst                     |  2 +-
 .../media/video.h.rst.exceptions                   |  0
 .../media/videodev2.h.rst.exceptions               |  0
 MAINTAINERS                                        |  8 +++++---
 drivers/media/radio/Kconfig                        | 10 +++++-----
 drivers/media/radio/wl128x/Kconfig                 |  2 +-
 462 files changed, 462 insertions(+), 460 deletions(-)
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
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_data_types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_function_calls.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_high_level.rst (100%)
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
 rename Documentation/{media/uapi => userspace-api/media}/v4l/common.rst (96%)
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
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-image-process.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-image-source.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-jpeg.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-rf-tuner.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/extended-controls.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/field-order.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/fieldseq_bt.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/fieldseq_tb.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/format.rst (98%)
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
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-reserved.rst (99%)
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

diff --git a/Documentation/ABI/testing/debugfs-cec-error-inj b/Documentation/ABI/testing/debugfs-cec-error-inj
index 4c3596c6d25b..5afcd78fbdb7 100644
--- a/Documentation/ABI/testing/debugfs-cec-error-inj
+++ b/Documentation/ABI/testing/debugfs-cec-error-inj
@@ -37,4 +37,4 @@ when changes are made.
 
 The following CEC error injection implementations exist:
 
-- Documentation/media/uapi/cec/cec-pin-error-inj.rst
+- Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
diff --git a/Documentation/Makefile b/Documentation/Makefile
index d77bb607aea4..e2518055c578 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -54,15 +54,15 @@ I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
 loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
 
 # $2 sphinx builder e.g. "html"
-# $3 name of the build subfolder / e.g. "media", used as:
+# $3 name of the build subfolder / e.g. "userspace-api/media", used as:
 #    * dest folder relative to $(BUILDDIR) and
 #    * cache folder relative to $(BUILDDIR)/.doctrees
-# $4 dest subfolder e.g. "man" for man pages at media/man
+# $4 dest subfolder e.g. "man" for man pages at userspace-api/media/man
 # $5 reST source folder relative to $(srctree)/$(src),
-#    e.g. "media" for the linux-tv book-set at ./Documentation/media
+#    e.g. "userspace-api/media" for the linux-tv book-set at ./Documentation/userspace-api/media
 
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
-      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media $2 && \
+      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
 	PYTHONDONTWRITEBYTECODE=1 \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
 	$(PYTHON) $(srctree)/scripts/jobserver-exec \
@@ -119,7 +119,7 @@ refcheckdocs:
 
 cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
-	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media clean
+	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media clean
 
 dochelp:
 	@echo  ' Linux kernel internal documentation in different formats from ReST:'
diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index 24cfaa15dd81..f7135b058246 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -10,7 +10,7 @@ if a symbol is not found at the documentation. That helps to keep the
 uAPI documentation in sync with the Kernel changes.
 The :ref:`parse_headers.pl <parse_headers>` provide a way to generate such
 cross-references. It has to be called via Makefile, while building the
-documentation. Please see ``Documentation/media/Makefile`` for an example
+documentation. Please see ``Documentation/userspace-api/media/Makefile`` for an example
 about how to use it inside the Kernel tree.
 
 .. _parse_headers:
diff --git a/Documentation/fb/api.rst b/Documentation/fb/api.rst
index 79ec33dded74..4f00e7196fef 100644
--- a/Documentation/fb/api.rst
+++ b/Documentation/fb/api.rst
@@ -290,12 +290,12 @@ the FB_CAP_FOURCC bit in the fb_fix_screeninfo capabilities field.
 FOURCC definitions are located in the linux/videodev2.h header. However, and
 despite starting with the V4L2_PIX_FMT_prefix, they are not restricted to V4L2
 and don't require usage of the V4L2 subsystem. FOURCC documentation is
-available in Documentation/media/uapi/v4l/pixfmt.rst.
+available in Documentation/userspace-api/media/v4l/pixfmt.rst.
 
 To select a format, applications set the grayscale field to the desired FOURCC.
 For YUV formats, they should also select the appropriate colorspace by setting
 the colorspace field to one of the colorspaces listed in linux/videodev2.h and
-documented in Documentation/media/uapi/v4l/colorspaces.rst.
+documented in Documentation/userspace-api/media/v4l/colorspaces.rst.
 
 The red, green, blue and transp fields are not used with the FOURCC-based API.
 For forward compatibility reasons applications must zero those fields, and
diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
index 0301c25ff887..8118c2d001ff 100644
--- a/Documentation/media/index.rst
+++ b/Documentation/media/index.rst
@@ -12,7 +12,7 @@ Linux Media Subsystem Documentation
 .. toctree::
    :maxdepth: 2
 
-   media_uapi
+   ../userspace-api/media/index
    media_kapi
    dvb-drivers/index
    v4l-drivers/index
diff --git a/Documentation/translations/it_IT/doc-guide/parse-headers.rst b/Documentation/translations/it_IT/doc-guide/parse-headers.rst
index b38918ca637e..993d549ee2b8 100644
--- a/Documentation/translations/it_IT/doc-guide/parse-headers.rst
+++ b/Documentation/translations/it_IT/doc-guide/parse-headers.rst
@@ -17,7 +17,7 @@ con le modifiche del kernel.
 Il programma :ref:`parse_headers.pl <it_parse_headers>` genera questi riferimenti.
 Esso dev'essere invocato attraverso un Makefile, mentre si genera la
 documentazione. Per avere un esempio su come utilizzarlo all'interno del kernel
-consultate ``Documentation/media/Makefile``.
+consultate ``Documentation/userspace-api/media/Makefile``.
 
 .. _it_parse_headers:
 
diff --git a/Documentation/media/Makefile b/Documentation/userspace-api/media/Makefile
similarity index 97%
rename from Documentation/media/Makefile
rename to Documentation/userspace-api/media/Makefile
index d75d70f191bc..81a4a1a53bce 100644
--- a/Documentation/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -2,7 +2,7 @@
 
 # Rules to convert a .h file to inline RST documentation
 
-SRC_DIR=$(srctree)/Documentation/media
+SRC_DIR=$(srctree)/Documentation/userspace-api/media
 PARSER = $(srctree)/Documentation/sphinx/parse-headers.pl
 UAPI = $(srctree)/include/uapi/linux
 KAPI = $(srctree)/include/linux
diff --git a/Documentation/media/audio.h.rst.exceptions b/Documentation/userspace-api/media/audio.h.rst.exceptions
similarity index 100%
rename from Documentation/media/audio.h.rst.exceptions
rename to Documentation/userspace-api/media/audio.h.rst.exceptions
diff --git a/Documentation/media/ca.h.rst.exceptions b/Documentation/userspace-api/media/ca.h.rst.exceptions
similarity index 100%
rename from Documentation/media/ca.h.rst.exceptions
rename to Documentation/userspace-api/media/ca.h.rst.exceptions
diff --git a/Documentation/media/cec.h.rst.exceptions b/Documentation/userspace-api/media/cec.h.rst.exceptions
similarity index 100%
rename from Documentation/media/cec.h.rst.exceptions
rename to Documentation/userspace-api/media/cec.h.rst.exceptions
diff --git a/Documentation/media/uapi/cec/cec-api.rst b/Documentation/userspace-api/media/cec/cec-api.rst
similarity index 95%
rename from Documentation/media/uapi/cec/cec-api.rst
rename to Documentation/userspace-api/media/cec/cec-api.rst
index 0780ba07995a..871db54dfd24 100644
--- a/Documentation/media/uapi/cec/cec-api.rst
+++ b/Documentation/userspace-api/media/cec/cec-api.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-func-close.rst b/Documentation/userspace-api/media/cec/cec-func-close.rst
similarity index 95%
rename from Documentation/media/uapi/cec/cec-func-close.rst
rename to Documentation/userspace-api/media/cec/cec-func-close.rst
index e10d675546f8..b89e06a43dad 100644
--- a/Documentation/media/uapi/cec/cec-func-close.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-close.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-func-ioctl.rst b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
similarity index 97%
rename from Documentation/media/uapi/cec/cec-func-ioctl.rst
rename to Documentation/userspace-api/media/cec/cec-func-ioctl.rst
index c18d4ba5eb37..d16a479aacb1 100644
--- a/Documentation/media/uapi/cec/cec-func-ioctl.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-func-open.rst b/Documentation/userspace-api/media/cec/cec-func-open.rst
similarity index 97%
rename from Documentation/media/uapi/cec/cec-func-open.rst
rename to Documentation/userspace-api/media/cec/cec-func-open.rst
index f235aa80155c..67fd021556b2 100644
--- a/Documentation/media/uapi/cec/cec-func-open.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-open.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-func-poll.rst b/Documentation/userspace-api/media/cec/cec-func-poll.rst
similarity index 97%
rename from Documentation/media/uapi/cec/cec-func-poll.rst
rename to Documentation/userspace-api/media/cec/cec-func-poll.rst
index 3f6c5b0effa3..ed3652d9bf17 100644
--- a/Documentation/media/uapi/cec/cec-func-poll.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-poll.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-funcs.rst b/Documentation/userspace-api/media/cec/cec-funcs.rst
similarity index 93%
rename from Documentation/media/uapi/cec/cec-funcs.rst
rename to Documentation/userspace-api/media/cec/cec-funcs.rst
index dc6da9c639a8..88966b5175d2 100644
--- a/Documentation/media/uapi/cec/cec-funcs.rst
+++ b/Documentation/userspace-api/media/cec/cec-funcs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-header.rst b/Documentation/userspace-api/media/cec/cec-header.rst
similarity index 90%
rename from Documentation/media/uapi/cec/cec-header.rst
rename to Documentation/userspace-api/media/cec/cec-header.rst
index 726f9766a130..24a83b0c35af 100644
--- a/Documentation/media/uapi/cec/cec-header.rst
+++ b/Documentation/userspace-api/media/cec/cec-header.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-intro.rst b/Documentation/userspace-api/media/cec/cec-intro.rst
similarity index 97%
rename from Documentation/media/uapi/cec/cec-intro.rst
rename to Documentation/userspace-api/media/cec/cec-intro.rst
index 05088fcefe81..a4db82388202 100644
--- a/Documentation/media/uapi/cec/cec-intro.rst
+++ b/Documentation/userspace-api/media/cec/cec-intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
similarity index 98%
rename from Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index 76761a98c312..94e46a11d68d 100644
--- a/Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
similarity index 100%
rename from Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
similarity index 99%
rename from Documentation/media/uapi/cec/cec-ioc-adap-g-log-addrs.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index 26465094e3f1..8ba3511c88b8 100644
--- a/Documentation/media/uapi/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-phys-addr.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
similarity index 98%
rename from Documentation/media/uapi/cec/cec-ioc-adap-g-phys-addr.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
index 693be2f9bf2e..ce8f64c3e060 100644
--- a/Documentation/media/uapi/cec/cec-ioc-adap-g-phys-addr.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
similarity index 99%
rename from Documentation/media/uapi/cec/cec-ioc-dqevent.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
index d16b226b1bef..4a535fb64b4b 100644
--- a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-ioc-g-mode.rst b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
similarity index 99%
rename from Documentation/media/uapi/cec/cec-ioc-g-mode.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
index 2535b77e3459..2d3227e80b4f 100644
--- a/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-ioc-receive.rst b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
similarity index 99%
rename from Documentation/media/uapi/cec/cec-ioc-receive.rst
rename to Documentation/userspace-api/media/cec/cec-ioc-receive.rst
index 4137903d672e..e456b2bc92a1 100644
--- a/Documentation/media/uapi/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/cec/cec-pin-error-inj.rst b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
similarity index 99%
rename from Documentation/media/uapi/cec/cec-pin-error-inj.rst
rename to Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
index 725f8b1c9965..78632199324d 100644
--- a/Documentation/media/uapi/cec/cec-pin-error-inj.rst
+++ b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/conf_nitpick.py b/Documentation/userspace-api/media/conf_nitpick.py
similarity index 100%
rename from Documentation/media/conf_nitpick.py
rename to Documentation/userspace-api/media/conf_nitpick.py
diff --git a/Documentation/media/dmx.h.rst.exceptions b/Documentation/userspace-api/media/dmx.h.rst.exceptions
similarity index 100%
rename from Documentation/media/dmx.h.rst.exceptions
rename to Documentation/userspace-api/media/dmx.h.rst.exceptions
diff --git a/Documentation/media/uapi/dvb/audio-bilingual-channel-select.rst b/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-bilingual-channel-select.rst
rename to Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
index ee2ee74dafa3..6841233f3fee 100644
--- a/Documentation/media/uapi/dvb/audio-bilingual-channel-select.rst
+++ b/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-channel-select.rst b/Documentation/userspace-api/media/dvb/audio-channel-select.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-channel-select.rst
rename to Documentation/userspace-api/media/dvb/audio-channel-select.rst
index ebb2f121c4c8..18e880e7eab4 100644
--- a/Documentation/media/uapi/dvb/audio-channel-select.rst
+++ b/Documentation/userspace-api/media/dvb/audio-channel-select.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-clear-buffer.rst b/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-clear-buffer.rst
rename to Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
index c5b62cde18c8..19f2ed752ce2 100644
--- a/Documentation/media/uapi/dvb/audio-clear-buffer.rst
+++ b/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-continue.rst b/Documentation/userspace-api/media/dvb/audio-continue.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-continue.rst
rename to Documentation/userspace-api/media/dvb/audio-continue.rst
index 6bdc99e39e20..b9a2b1e608b6 100644
--- a/Documentation/media/uapi/dvb/audio-continue.rst
+++ b/Documentation/userspace-api/media/dvb/audio-continue.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-fclose.rst b/Documentation/userspace-api/media/dvb/audio-fclose.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-fclose.rst
rename to Documentation/userspace-api/media/dvb/audio-fclose.rst
index 1e4ad7a0325d..448471d2f570 100644
--- a/Documentation/media/uapi/dvb/audio-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/audio-fclose.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-fopen.rst b/Documentation/userspace-api/media/dvb/audio-fopen.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/audio-fopen.rst
rename to Documentation/userspace-api/media/dvb/audio-fopen.rst
index 2cf4d83661f4..f7ae94378f92 100644
--- a/Documentation/media/uapi/dvb/audio-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/audio-fopen.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-fwrite.rst b/Documentation/userspace-api/media/dvb/audio-fwrite.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-fwrite.rst
rename to Documentation/userspace-api/media/dvb/audio-fwrite.rst
index 6dc6bf6cbbc7..1482636f9b1a 100644
--- a/Documentation/media/uapi/dvb/audio-fwrite.rst
+++ b/Documentation/userspace-api/media/dvb/audio-fwrite.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-get-capabilities.rst b/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-get-capabilities.rst
rename to Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
index 4f1ec47e8ac2..4e70d82969ad 100644
--- a/Documentation/media/uapi/dvb/audio-get-capabilities.rst
+++ b/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-get-status.rst b/Documentation/userspace-api/media/dvb/audio-get-status.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-get-status.rst
rename to Documentation/userspace-api/media/dvb/audio-get-status.rst
index 30e4dd7fce6d..5a5180d642d4 100644
--- a/Documentation/media/uapi/dvb/audio-get-status.rst
+++ b/Documentation/userspace-api/media/dvb/audio-get-status.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-pause.rst b/Documentation/userspace-api/media/dvb/audio-pause.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-pause.rst
rename to Documentation/userspace-api/media/dvb/audio-pause.rst
index 4567ecd9e0a3..3e9fe06d3a0f 100644
--- a/Documentation/media/uapi/dvb/audio-pause.rst
+++ b/Documentation/userspace-api/media/dvb/audio-pause.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-play.rst b/Documentation/userspace-api/media/dvb/audio-play.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-play.rst
rename to Documentation/userspace-api/media/dvb/audio-play.rst
index 17acd4c411b8..388a581a19f2 100644
--- a/Documentation/media/uapi/dvb/audio-play.rst
+++ b/Documentation/userspace-api/media/dvb/audio-play.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-select-source.rst b/Documentation/userspace-api/media/dvb/audio-select-source.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-select-source.rst
rename to Documentation/userspace-api/media/dvb/audio-select-source.rst
index c5ed6243b11c..1ce64507de93 100644
--- a/Documentation/media/uapi/dvb/audio-select-source.rst
+++ b/Documentation/userspace-api/media/dvb/audio-select-source.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-set-av-sync.rst b/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-set-av-sync.rst
rename to Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
index c116d105fdea..3a0400dcfae4 100644
--- a/Documentation/media/uapi/dvb/audio-set-av-sync.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-set-bypass-mode.rst b/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-set-bypass-mode.rst
rename to Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
index d68f05d48d12..0d2f23cc2f16 100644
--- a/Documentation/media/uapi/dvb/audio-set-bypass-mode.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-set-id.rst b/Documentation/userspace-api/media/dvb/audio-set-id.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-set-id.rst
rename to Documentation/userspace-api/media/dvb/audio-set-id.rst
index aeb6ace6cd1e..83fc1217fda0 100644
--- a/Documentation/media/uapi/dvb/audio-set-id.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-id.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-set-mixer.rst b/Documentation/userspace-api/media/dvb/audio-set-mixer.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-set-mixer.rst
rename to Documentation/userspace-api/media/dvb/audio-set-mixer.rst
index 60781aa88202..52bfc3af79dc 100644
--- a/Documentation/media/uapi/dvb/audio-set-mixer.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-mixer.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-set-mute.rst b/Documentation/userspace-api/media/dvb/audio-set-mute.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-set-mute.rst
rename to Documentation/userspace-api/media/dvb/audio-set-mute.rst
index 4449f225e48c..8f3a8332cebc 100644
--- a/Documentation/media/uapi/dvb/audio-set-mute.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-mute.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-set-streamtype.rst b/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/audio-set-streamtype.rst
rename to Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
index d20c34fc7128..c22bd247f03d 100644
--- a/Documentation/media/uapi/dvb/audio-set-streamtype.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio-stop.rst b/Documentation/userspace-api/media/dvb/audio-stop.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio-stop.rst
rename to Documentation/userspace-api/media/dvb/audio-stop.rst
index 1bba2e50c364..291b6a42efac 100644
--- a/Documentation/media/uapi/dvb/audio-stop.rst
+++ b/Documentation/userspace-api/media/dvb/audio-stop.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio.rst b/Documentation/userspace-api/media/dvb/audio.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/audio.rst
rename to Documentation/userspace-api/media/dvb/audio.rst
index ebc18fca76a4..e137c151335d 100644
--- a/Documentation/media/uapi/dvb/audio.rst
+++ b/Documentation/userspace-api/media/dvb/audio.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio_data_types.rst b/Documentation/userspace-api/media/dvb/audio_data_types.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/audio_data_types.rst
rename to Documentation/userspace-api/media/dvb/audio_data_types.rst
index 5b032fe13b9d..effe265b12d5 100644
--- a/Documentation/media/uapi/dvb/audio_data_types.rst
+++ b/Documentation/userspace-api/media/dvb/audio_data_types.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/audio_function_calls.rst b/Documentation/userspace-api/media/dvb/audio_function_calls.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/audio_function_calls.rst
rename to Documentation/userspace-api/media/dvb/audio_function_calls.rst
index 5478e78b085e..be90a828fe29 100644
--- a/Documentation/media/uapi/dvb/audio_function_calls.rst
+++ b/Documentation/userspace-api/media/dvb/audio_function_calls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-fclose.rst b/Documentation/userspace-api/media/dvb/ca-fclose.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/ca-fclose.rst
rename to Documentation/userspace-api/media/dvb/ca-fclose.rst
index e273444ccc67..cedfb7ee6a01 100644
--- a/Documentation/media/uapi/dvb/ca-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/ca-fclose.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-fopen.rst b/Documentation/userspace-api/media/dvb/ca-fopen.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/ca-fopen.rst
rename to Documentation/userspace-api/media/dvb/ca-fopen.rst
index e11ebeae5693..aa0fde1739a8 100644
--- a/Documentation/media/uapi/dvb/ca-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/ca-fopen.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-get-cap.rst b/Documentation/userspace-api/media/dvb/ca-get-cap.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/ca-get-cap.rst
rename to Documentation/userspace-api/media/dvb/ca-get-cap.rst
index 9e4fb5186373..b808d0592371 100644
--- a/Documentation/media/uapi/dvb/ca-get-cap.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-cap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-get-descr-info.rst b/Documentation/userspace-api/media/dvb/ca-get-descr-info.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/ca-get-descr-info.rst
rename to Documentation/userspace-api/media/dvb/ca-get-descr-info.rst
index 80ef43a339df..396cc66a8243 100644
--- a/Documentation/media/uapi/dvb/ca-get-descr-info.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-descr-info.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-get-msg.rst b/Documentation/userspace-api/media/dvb/ca-get-msg.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/ca-get-msg.rst
rename to Documentation/userspace-api/media/dvb/ca-get-msg.rst
index bcb7955a0ddc..995f461d6879 100644
--- a/Documentation/media/uapi/dvb/ca-get-msg.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-msg.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-get-slot-info.rst b/Documentation/userspace-api/media/dvb/ca-get-slot-info.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/ca-get-slot-info.rst
rename to Documentation/userspace-api/media/dvb/ca-get-slot-info.rst
index 1ea5c497f2ea..c65987ff9cb3 100644
--- a/Documentation/media/uapi/dvb/ca-get-slot-info.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-slot-info.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-reset.rst b/Documentation/userspace-api/media/dvb/ca-reset.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/ca-reset.rst
rename to Documentation/userspace-api/media/dvb/ca-reset.rst
index 29fda19984be..116a5a8eeb5d 100644
--- a/Documentation/media/uapi/dvb/ca-reset.rst
+++ b/Documentation/userspace-api/media/dvb/ca-reset.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-send-msg.rst b/Documentation/userspace-api/media/dvb/ca-send-msg.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/ca-send-msg.rst
rename to Documentation/userspace-api/media/dvb/ca-send-msg.rst
index 5a3c4e8120c4..716d88e0fdc5 100644
--- a/Documentation/media/uapi/dvb/ca-send-msg.rst
+++ b/Documentation/userspace-api/media/dvb/ca-send-msg.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca-set-descr.rst b/Documentation/userspace-api/media/dvb/ca-set-descr.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/ca-set-descr.rst
rename to Documentation/userspace-api/media/dvb/ca-set-descr.rst
index d36464ba2317..2c57371675e2 100644
--- a/Documentation/media/uapi/dvb/ca-set-descr.rst
+++ b/Documentation/userspace-api/media/dvb/ca-set-descr.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca.rst b/Documentation/userspace-api/media/dvb/ca.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/ca.rst
rename to Documentation/userspace-api/media/dvb/ca.rst
index c6ee624b1234..643b7c414943 100644
--- a/Documentation/media/uapi/dvb/ca.rst
+++ b/Documentation/userspace-api/media/dvb/ca.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca_data_types.rst b/Documentation/userspace-api/media/dvb/ca_data_types.rst
similarity index 90%
rename from Documentation/media/uapi/dvb/ca_data_types.rst
rename to Documentation/userspace-api/media/dvb/ca_data_types.rst
index 834c8ab4c300..20e2b552144f 100644
--- a/Documentation/media/uapi/dvb/ca_data_types.rst
+++ b/Documentation/userspace-api/media/dvb/ca_data_types.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca_function_calls.rst b/Documentation/userspace-api/media/dvb/ca_function_calls.rst
similarity index 92%
rename from Documentation/media/uapi/dvb/ca_function_calls.rst
rename to Documentation/userspace-api/media/dvb/ca_function_calls.rst
index 6985bebd0661..b8aceb1895b6 100644
--- a/Documentation/media/uapi/dvb/ca_function_calls.rst
+++ b/Documentation/userspace-api/media/dvb/ca_function_calls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/ca_high_level.rst b/Documentation/userspace-api/media/dvb/ca_high_level.rst
similarity index 100%
rename from Documentation/media/uapi/dvb/ca_high_level.rst
rename to Documentation/userspace-api/media/dvb/ca_high_level.rst
diff --git a/Documentation/media/uapi/dvb/demux.rst b/Documentation/userspace-api/media/dvb/demux.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/demux.rst
rename to Documentation/userspace-api/media/dvb/demux.rst
index d8c0ff4015fe..00397b075e0f 100644
--- a/Documentation/media/uapi/dvb/demux.rst
+++ b/Documentation/userspace-api/media/dvb/demux.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-add-pid.rst b/Documentation/userspace-api/media/dvb/dmx-add-pid.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/dmx-add-pid.rst
rename to Documentation/userspace-api/media/dvb/dmx-add-pid.rst
index f483268e4ede..e309cd56fdf0 100644
--- a/Documentation/media/uapi/dvb/dmx-add-pid.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-add-pid.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-expbuf.rst b/Documentation/userspace-api/media/dvb/dmx-expbuf.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/dmx-expbuf.rst
rename to Documentation/userspace-api/media/dvb/dmx-expbuf.rst
index d7f0658f3db3..f76db8ce3cfa 100644
--- a/Documentation/media/uapi/dvb/dmx-expbuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-expbuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-fclose.rst b/Documentation/userspace-api/media/dvb/dmx-fclose.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/dmx-fclose.rst
rename to Documentation/userspace-api/media/dvb/dmx-fclose.rst
index 05ff32270274..e93bc60da508 100644
--- a/Documentation/media/uapi/dvb/dmx-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fclose.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-fopen.rst b/Documentation/userspace-api/media/dvb/dmx-fopen.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/dmx-fopen.rst
rename to Documentation/userspace-api/media/dvb/dmx-fopen.rst
index 2700a2fad68b..ea988714558e 100644
--- a/Documentation/media/uapi/dvb/dmx-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fopen.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-fread.rst b/Documentation/userspace-api/media/dvb/dmx-fread.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/dmx-fread.rst
rename to Documentation/userspace-api/media/dvb/dmx-fread.rst
index 292fa98f39ff..25501be818f8 100644
--- a/Documentation/media/uapi/dvb/dmx-fread.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fread.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-fwrite.rst b/Documentation/userspace-api/media/dvb/dmx-fwrite.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/dmx-fwrite.rst
rename to Documentation/userspace-api/media/dvb/dmx-fwrite.rst
index bdd4d4743bd5..4400f4ef8c65 100644
--- a/Documentation/media/uapi/dvb/dmx-fwrite.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fwrite.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-get-pes-pids.rst b/Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/dmx-get-pes-pids.rst
rename to Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst
index fcd3dc06c095..e1873e3fdc01 100644
--- a/Documentation/media/uapi/dvb/dmx-get-pes-pids.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-get-stc.rst b/Documentation/userspace-api/media/dvb/dmx-get-stc.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/dmx-get-stc.rst
rename to Documentation/userspace-api/media/dvb/dmx-get-stc.rst
index 2c81595f470a..026a884edb0a 100644
--- a/Documentation/media/uapi/dvb/dmx-get-stc.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-get-stc.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-mmap.rst b/Documentation/userspace-api/media/dvb/dmx-mmap.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/dmx-mmap.rst
rename to Documentation/userspace-api/media/dvb/dmx-mmap.rst
index 34bb7766718f..828ba9df73e2 100644
--- a/Documentation/media/uapi/dvb/dmx-mmap.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-mmap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-munmap.rst b/Documentation/userspace-api/media/dvb/dmx-munmap.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/dmx-munmap.rst
rename to Documentation/userspace-api/media/dvb/dmx-munmap.rst
index ef26b6f2b12b..905fdd585a86 100644
--- a/Documentation/media/uapi/dvb/dmx-munmap.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-munmap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-qbuf.rst b/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/dmx-qbuf.rst
rename to Documentation/userspace-api/media/dvb/dmx-qbuf.rst
index 9dc845daa59d..2c4657c2c86d 100644
--- a/Documentation/media/uapi/dvb/dmx-qbuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-querybuf.rst b/Documentation/userspace-api/media/dvb/dmx-querybuf.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/dmx-querybuf.rst
rename to Documentation/userspace-api/media/dvb/dmx-querybuf.rst
index 4cf36e821696..6e234daf1c44 100644
--- a/Documentation/media/uapi/dvb/dmx-querybuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-querybuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-remove-pid.rst b/Documentation/userspace-api/media/dvb/dmx-remove-pid.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/dmx-remove-pid.rst
rename to Documentation/userspace-api/media/dvb/dmx-remove-pid.rst
index be992f44f306..dee553a48b63 100644
--- a/Documentation/media/uapi/dvb/dmx-remove-pid.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-remove-pid.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-reqbufs.rst b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/dmx-reqbufs.rst
rename to Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
index b302785bf678..9b9be45d2b0b 100644
--- a/Documentation/media/uapi/dvb/dmx-reqbufs.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-set-buffer-size.rst b/Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/dmx-set-buffer-size.rst
rename to Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst
index 2dee0fb11f62..7c91da1da4be 100644
--- a/Documentation/media/uapi/dvb/dmx-set-buffer-size.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-set-filter.rst b/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/dmx-set-filter.rst
rename to Documentation/userspace-api/media/dvb/dmx-set-filter.rst
index 66afbb9f2fe4..cb3333349bd0 100644
--- a/Documentation/media/uapi/dvb/dmx-set-filter.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-set-pes-filter.rst b/Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/dmx-set-pes-filter.rst
rename to Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst
index dae5ab7878e5..26da56947652 100644
--- a/Documentation/media/uapi/dvb/dmx-set-pes-filter.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-start.rst b/Documentation/userspace-api/media/dvb/dmx-start.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/dmx-start.rst
rename to Documentation/userspace-api/media/dvb/dmx-start.rst
index 488289d02504..a1d35f01fc95 100644
--- a/Documentation/media/uapi/dvb/dmx-start.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-start.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx-stop.rst b/Documentation/userspace-api/media/dvb/dmx-stop.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/dmx-stop.rst
rename to Documentation/userspace-api/media/dvb/dmx-stop.rst
index 982384d12923..5e6e805010d0 100644
--- a/Documentation/media/uapi/dvb/dmx-stop.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-stop.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx_fcalls.rst b/Documentation/userspace-api/media/dvb/dmx_fcalls.rst
similarity index 93%
rename from Documentation/media/uapi/dvb/dmx_fcalls.rst
rename to Documentation/userspace-api/media/dvb/dmx_fcalls.rst
index 67312ab65f94..04e150f00f84 100644
--- a/Documentation/media/uapi/dvb/dmx_fcalls.rst
+++ b/Documentation/userspace-api/media/dvb/dmx_fcalls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dmx_types.rst b/Documentation/userspace-api/media/dvb/dmx_types.rst
similarity index 90%
rename from Documentation/media/uapi/dvb/dmx_types.rst
rename to Documentation/userspace-api/media/dvb/dmx_types.rst
index b5cf704199e5..635b8fd363be 100644
--- a/Documentation/media/uapi/dvb/dmx_types.rst
+++ b/Documentation/userspace-api/media/dvb/dmx_types.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dvb-fe-read-status.rst b/Documentation/userspace-api/media/dvb/dvb-fe-read-status.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/dvb-fe-read-status.rst
rename to Documentation/userspace-api/media/dvb/dvb-fe-read-status.rst
index 172783b75fb7..5d6a7735a9d1 100644
--- a/Documentation/media/uapi/dvb/dvb-fe-read-status.rst
+++ b/Documentation/userspace-api/media/dvb/dvb-fe-read-status.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dvb-frontend-event.rst b/Documentation/userspace-api/media/dvb/dvb-frontend-event.rst
similarity index 91%
rename from Documentation/media/uapi/dvb/dvb-frontend-event.rst
rename to Documentation/userspace-api/media/dvb/dvb-frontend-event.rst
index ad4af66040c7..7f5e56cf75cb 100644
--- a/Documentation/media/uapi/dvb/dvb-frontend-event.rst
+++ b/Documentation/userspace-api/media/dvb/dvb-frontend-event.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dvb-frontend-parameters.rst b/Documentation/userspace-api/media/dvb/dvb-frontend-parameters.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/dvb-frontend-parameters.rst
rename to Documentation/userspace-api/media/dvb/dvb-frontend-parameters.rst
index 67c2a316019f..83b1bcc6ef54 100644
--- a/Documentation/media/uapi/dvb/dvb-frontend-parameters.rst
+++ b/Documentation/userspace-api/media/dvb/dvb-frontend-parameters.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dvbapi.rst b/Documentation/userspace-api/media/dvb/dvbapi.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/dvbapi.rst
rename to Documentation/userspace-api/media/dvb/dvbapi.rst
index 0fcc01f182f9..74b16ab3fd94 100644
--- a/Documentation/media/uapi/dvb/dvbapi.rst
+++ b/Documentation/userspace-api/media/dvb/dvbapi.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dvbproperty.rst b/Documentation/userspace-api/media/dvb/dvbproperty.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/dvbproperty.rst
rename to Documentation/userspace-api/media/dvb/dvbproperty.rst
index 0c4f5598f2be..1716733d24ba 100644
--- a/Documentation/media/uapi/dvb/dvbproperty.rst
+++ b/Documentation/userspace-api/media/dvb/dvbproperty.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/dvbstb.svg b/Documentation/userspace-api/media/dvb/dvbstb.svg
similarity index 99%
rename from Documentation/media/uapi/dvb/dvbstb.svg
rename to Documentation/userspace-api/media/dvb/dvbstb.svg
index c7672148d6ff..b333d0ff944f 100644
--- a/Documentation/media/uapi/dvb/dvbstb.svg
+++ b/Documentation/userspace-api/media/dvb/dvbstb.svg
@@ -22,7 +22,7 @@
        Version 1.1 or any later version published by the Free Software
        Foundation, with no Invariant Sections, no Front-Cover Texts
        and no Back-Cover Texts. A copy of the license is included at
-       Documentation/media/uapi/fdl-appendix.rst.
+       Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/dvb/examples.rst b/Documentation/userspace-api/media/dvb/examples.rst
similarity index 93%
rename from Documentation/media/uapi/dvb/examples.rst
rename to Documentation/userspace-api/media/dvb/examples.rst
index eaa41bc8d173..bd0adde86b96 100644
--- a/Documentation/media/uapi/dvb/examples.rst
+++ b/Documentation/userspace-api/media/dvb/examples.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-bandwidth-t.rst b/Documentation/userspace-api/media/dvb/fe-bandwidth-t.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/fe-bandwidth-t.rst
rename to Documentation/userspace-api/media/dvb/fe-bandwidth-t.rst
index c3d7837b5f87..6293287af67c 100644
--- a/Documentation/media/uapi/dvb/fe-bandwidth-t.rst
+++ b/Documentation/userspace-api/media/dvb/fe-bandwidth-t.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-diseqc-recv-slave-reply.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/fe-diseqc-recv-slave-reply.rst
rename to Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst
index 88fd2186ca4d..b520974e8c46 100644
--- a/Documentation/media/uapi/dvb/fe-diseqc-recv-slave-reply.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-diseqc-reset-overload.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-diseqc-reset-overload.rst
rename to Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst
index 92929c2e75db..c59af46b8e87 100644
--- a/Documentation/media/uapi/dvb/fe-diseqc-reset-overload.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-diseqc-send-burst.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-diseqc-send-burst.rst
rename to Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
index 8af872d306aa..19b51d0550f7 100644
--- a/Documentation/media/uapi/dvb/fe-diseqc-send-burst.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-diseqc-send-master-cmd.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/fe-diseqc-send-master-cmd.rst
rename to Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst
index 30a48114153c..f75513d018c8 100644
--- a/Documentation/media/uapi/dvb/fe-diseqc-send-master-cmd.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-dishnetwork-send-legacy-cmd.rst b/Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-dishnetwork-send-legacy-cmd.rst
rename to Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst
index 13811289971b..ea66f72fe5f8 100644
--- a/Documentation/media/uapi/dvb/fe-dishnetwork-send-legacy-cmd.rst
+++ b/Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-enable-high-lnb-voltage.rst b/Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-enable-high-lnb-voltage.rst
rename to Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst
index 32b7d140d80b..9bdf1e898ddc 100644
--- a/Documentation/media/uapi/dvb/fe-enable-high-lnb-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-get-event.rst b/Documentation/userspace-api/media/dvb/fe-get-event.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-get-event.rst
rename to Documentation/userspace-api/media/dvb/fe-get-event.rst
index 2573d5b9b636..19df41dca238 100644
--- a/Documentation/media/uapi/dvb/fe-get-event.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-event.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-get-frontend.rst b/Documentation/userspace-api/media/dvb/fe-get-frontend.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-get-frontend.rst
rename to Documentation/userspace-api/media/dvb/fe-get-frontend.rst
index 6cd5250d1832..7968adc8e982 100644
--- a/Documentation/media/uapi/dvb/fe-get-frontend.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-frontend.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-get-info.rst b/Documentation/userspace-api/media/dvb/fe-get-info.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-get-info.rst
rename to Documentation/userspace-api/media/dvb/fe-get-info.rst
index 551e68b11528..80d9f8195ac4 100644
--- a/Documentation/media/uapi/dvb/fe-get-info.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-info.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-get-property.rst b/Documentation/userspace-api/media/dvb/fe-get-property.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/fe-get-property.rst
rename to Documentation/userspace-api/media/dvb/fe-get-property.rst
index 99386c7461b3..088d4e319405 100644
--- a/Documentation/media/uapi/dvb/fe-get-property.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-property.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-read-ber.rst b/Documentation/userspace-api/media/dvb/fe-read-ber.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/fe-read-ber.rst
rename to Documentation/userspace-api/media/dvb/fe-read-ber.rst
index e579d648687e..d0a706ac9011 100644
--- a/Documentation/media/uapi/dvb/fe-read-ber.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-ber.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-read-signal-strength.rst b/Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/fe-read-signal-strength.rst
rename to Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst
index 0a0c0c2ff207..df79837de47d 100644
--- a/Documentation/media/uapi/dvb/fe-read-signal-strength.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-read-snr.rst b/Documentation/userspace-api/media/dvb/fe-read-snr.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/fe-read-snr.rst
rename to Documentation/userspace-api/media/dvb/fe-read-snr.rst
index 2a7a0d8f1fd5..e56147a40e23 100644
--- a/Documentation/media/uapi/dvb/fe-read-snr.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-snr.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-read-status.rst b/Documentation/userspace-api/media/dvb/fe-read-status.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/fe-read-status.rst
rename to Documentation/userspace-api/media/dvb/fe-read-status.rst
index 0dfc9fdf568f..cf781d463a20 100644
--- a/Documentation/media/uapi/dvb/fe-read-status.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-status.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-read-uncorrected-blocks.rst b/Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-read-uncorrected-blocks.rst
rename to Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst
index 19c532f750aa..d042e8c86930 100644
--- a/Documentation/media/uapi/dvb/fe-read-uncorrected-blocks.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-set-frontend-tune-mode.rst b/Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-set-frontend-tune-mode.rst
rename to Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst
index 36e8913170e1..8e059967f49c 100644
--- a/Documentation/media/uapi/dvb/fe-set-frontend-tune-mode.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-set-frontend.rst b/Documentation/userspace-api/media/dvb/fe-set-frontend.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/fe-set-frontend.rst
rename to Documentation/userspace-api/media/dvb/fe-set-frontend.rst
index 23caae2588d2..960c95cb18a0 100644
--- a/Documentation/media/uapi/dvb/fe-set-frontend.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-frontend.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-set-tone.rst b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/fe-set-tone.rst
rename to Documentation/userspace-api/media/dvb/fe-set-tone.rst
index fb605e8c9fc4..5726a20c7991 100644
--- a/Documentation/media/uapi/dvb/fe-set-tone.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-set-voltage.rst b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/fe-set-voltage.rst
rename to Documentation/userspace-api/media/dvb/fe-set-voltage.rst
index c81a8e6a59aa..f3191808f4fd 100644
--- a/Documentation/media/uapi/dvb/fe-set-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe-type-t.rst b/Documentation/userspace-api/media/dvb/fe-type-t.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/fe-type-t.rst
rename to Documentation/userspace-api/media/dvb/fe-type-t.rst
index 9720d2f7ba35..1617a8cc9045 100644
--- a/Documentation/media/uapi/dvb/fe-type-t.rst
+++ b/Documentation/userspace-api/media/dvb/fe-type-t.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/fe_property_parameters.rst b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
similarity index 99%
rename from Documentation/media/uapi/dvb/fe_property_parameters.rst
rename to Documentation/userspace-api/media/dvb/fe_property_parameters.rst
index 2fd2954d8dae..3f4ced2800e3 100644
--- a/Documentation/media/uapi/dvb/fe_property_parameters.rst
+++ b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend-header.rst b/Documentation/userspace-api/media/dvb/frontend-header.rst
similarity index 90%
rename from Documentation/media/uapi/dvb/frontend-header.rst
rename to Documentation/userspace-api/media/dvb/frontend-header.rst
index 635fb4251214..cf8e515e5e1f 100644
--- a/Documentation/media/uapi/dvb/frontend-header.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-header.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend-property-cable-systems.rst b/Documentation/userspace-api/media/dvb/frontend-property-cable-systems.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/frontend-property-cable-systems.rst
rename to Documentation/userspace-api/media/dvb/frontend-property-cable-systems.rst
index 97fbfc228c10..56657a6ec6ff 100644
--- a/Documentation/media/uapi/dvb/frontend-property-cable-systems.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-property-cable-systems.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend-property-satellite-systems.rst b/Documentation/userspace-api/media/dvb/frontend-property-satellite-systems.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/frontend-property-satellite-systems.rst
rename to Documentation/userspace-api/media/dvb/frontend-property-satellite-systems.rst
index 2bc880a3c826..e64fd625c476 100644
--- a/Documentation/media/uapi/dvb/frontend-property-satellite-systems.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-property-satellite-systems.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend-property-terrestrial-systems.rst b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
similarity index 99%
rename from Documentation/media/uapi/dvb/frontend-property-terrestrial-systems.rst
rename to Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
index c20af13297e5..1079522b2425 100644
--- a/Documentation/media/uapi/dvb/frontend-property-terrestrial-systems.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend-stat-properties.rst b/Documentation/userspace-api/media/dvb/frontend-stat-properties.rst
similarity index 99%
rename from Documentation/media/uapi/dvb/frontend-stat-properties.rst
rename to Documentation/userspace-api/media/dvb/frontend-stat-properties.rst
index 546464db04b5..ae6ed5128deb 100644
--- a/Documentation/media/uapi/dvb/frontend-stat-properties.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-stat-properties.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend.rst b/Documentation/userspace-api/media/dvb/frontend.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/frontend.rst
rename to Documentation/userspace-api/media/dvb/frontend.rst
index 7ff225dfe11c..41ad519ca502 100644
--- a/Documentation/media/uapi/dvb/frontend.rst
+++ b/Documentation/userspace-api/media/dvb/frontend.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend_f_close.rst b/Documentation/userspace-api/media/dvb/frontend_f_close.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/frontend_f_close.rst
rename to Documentation/userspace-api/media/dvb/frontend_f_close.rst
index af87c2a83719..582e19a83c1a 100644
--- a/Documentation/media/uapi/dvb/frontend_f_close.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_f_close.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend_f_open.rst b/Documentation/userspace-api/media/dvb/frontend_f_open.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/frontend_f_open.rst
rename to Documentation/userspace-api/media/dvb/frontend_f_open.rst
index 6a46ec5acf7b..0be3b249d33b 100644
--- a/Documentation/media/uapi/dvb/frontend_f_open.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_f_open.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend_fcalls.rst b/Documentation/userspace-api/media/dvb/frontend_fcalls.rst
similarity index 93%
rename from Documentation/media/uapi/dvb/frontend_fcalls.rst
rename to Documentation/userspace-api/media/dvb/frontend_fcalls.rst
index 9b3586f538ea..2b5e7a4dba9e 100644
--- a/Documentation/media/uapi/dvb/frontend_fcalls.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_fcalls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend_legacy_api.rst b/Documentation/userspace-api/media/dvb/frontend_legacy_api.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/frontend_legacy_api.rst
rename to Documentation/userspace-api/media/dvb/frontend_legacy_api.rst
index 1ea749d09ca2..1bd804f9b364 100644
--- a/Documentation/media/uapi/dvb/frontend_legacy_api.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_legacy_api.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/frontend_legacy_dvbv3_api.rst b/Documentation/userspace-api/media/dvb/frontend_legacy_dvbv3_api.rst
similarity index 93%
rename from Documentation/media/uapi/dvb/frontend_legacy_dvbv3_api.rst
rename to Documentation/userspace-api/media/dvb/frontend_legacy_dvbv3_api.rst
index 1567bc73855a..29ad0f9b90a4 100644
--- a/Documentation/media/uapi/dvb/frontend_legacy_dvbv3_api.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_legacy_dvbv3_api.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/headers.rst b/Documentation/userspace-api/media/dvb/headers.rst
similarity index 93%
rename from Documentation/media/uapi/dvb/headers.rst
rename to Documentation/userspace-api/media/dvb/headers.rst
index edeabd9e8e90..ffd8f432484a 100644
--- a/Documentation/media/uapi/dvb/headers.rst
+++ b/Documentation/userspace-api/media/dvb/headers.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/intro.rst b/Documentation/userspace-api/media/dvb/intro.rst
similarity index 99%
rename from Documentation/media/uapi/dvb/intro.rst
rename to Documentation/userspace-api/media/dvb/intro.rst
index f1384616ac4e..f1235ef4599e 100644
--- a/Documentation/media/uapi/dvb/intro.rst
+++ b/Documentation/userspace-api/media/dvb/intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/legacy_dvb_apis.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/legacy_dvb_apis.rst
rename to Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
index a43b4c36d935..17c3b062afb3 100644
--- a/Documentation/media/uapi/dvb/legacy_dvb_apis.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/net-add-if.rst b/Documentation/userspace-api/media/dvb/net-add-if.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/net-add-if.rst
rename to Documentation/userspace-api/media/dvb/net-add-if.rst
index 1188641b453e..e75ec4d80a08 100644
--- a/Documentation/media/uapi/dvb/net-add-if.rst
+++ b/Documentation/userspace-api/media/dvb/net-add-if.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/net-get-if.rst b/Documentation/userspace-api/media/dvb/net-get-if.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/net-get-if.rst
rename to Documentation/userspace-api/media/dvb/net-get-if.rst
index 7c4ef4b9d6cc..c5421d9a8c0b 100644
--- a/Documentation/media/uapi/dvb/net-get-if.rst
+++ b/Documentation/userspace-api/media/dvb/net-get-if.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/net-remove-if.rst b/Documentation/userspace-api/media/dvb/net-remove-if.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/net-remove-if.rst
rename to Documentation/userspace-api/media/dvb/net-remove-if.rst
index bf9a1602eeec..d530559f66f1 100644
--- a/Documentation/media/uapi/dvb/net-remove-if.rst
+++ b/Documentation/userspace-api/media/dvb/net-remove-if.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/net-types.rst b/Documentation/userspace-api/media/dvb/net-types.rst
similarity index 90%
rename from Documentation/media/uapi/dvb/net-types.rst
rename to Documentation/userspace-api/media/dvb/net-types.rst
index 9e16462a1ef4..94323cffe8af 100644
--- a/Documentation/media/uapi/dvb/net-types.rst
+++ b/Documentation/userspace-api/media/dvb/net-types.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/net.rst b/Documentation/userspace-api/media/dvb/net.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/net.rst
rename to Documentation/userspace-api/media/dvb/net.rst
index 833daa381968..084f33d1ba28 100644
--- a/Documentation/media/uapi/dvb/net.rst
+++ b/Documentation/userspace-api/media/dvb/net.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/query-dvb-frontend-info.rst b/Documentation/userspace-api/media/dvb/query-dvb-frontend-info.rst
similarity index 93%
rename from Documentation/media/uapi/dvb/query-dvb-frontend-info.rst
rename to Documentation/userspace-api/media/dvb/query-dvb-frontend-info.rst
index 9a6badc1d295..d854ccf42ccf 100644
--- a/Documentation/media/uapi/dvb/query-dvb-frontend-info.rst
+++ b/Documentation/userspace-api/media/dvb/query-dvb-frontend-info.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-clear-buffer.rst b/Documentation/userspace-api/media/dvb/video-clear-buffer.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/video-clear-buffer.rst
rename to Documentation/userspace-api/media/dvb/video-clear-buffer.rst
index 5eb5546e8ce4..ba7a13302862 100644
--- a/Documentation/media/uapi/dvb/video-clear-buffer.rst
+++ b/Documentation/userspace-api/media/dvb/video-clear-buffer.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-command.rst b/Documentation/userspace-api/media/dvb/video-command.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/video-command.rst
rename to Documentation/userspace-api/media/dvb/video-command.rst
index 020b49645c6b..d96d764d0eef 100644
--- a/Documentation/media/uapi/dvb/video-command.rst
+++ b/Documentation/userspace-api/media/dvb/video-command.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-continue.rst b/Documentation/userspace-api/media/dvb/video-continue.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-continue.rst
rename to Documentation/userspace-api/media/dvb/video-continue.rst
index 2ae2067dfba8..bb18514ac5e9 100644
--- a/Documentation/media/uapi/dvb/video-continue.rst
+++ b/Documentation/userspace-api/media/dvb/video-continue.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-fast-forward.rst b/Documentation/userspace-api/media/dvb/video-fast-forward.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-fast-forward.rst
rename to Documentation/userspace-api/media/dvb/video-fast-forward.rst
index 3f805f334ae1..1f6ec89574d1 100644
--- a/Documentation/media/uapi/dvb/video-fast-forward.rst
+++ b/Documentation/userspace-api/media/dvb/video-fast-forward.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-fclose.rst b/Documentation/userspace-api/media/dvb/video-fclose.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/video-fclose.rst
rename to Documentation/userspace-api/media/dvb/video-fclose.rst
index 3b0285b96a3c..f9d2a8ebe4a4 100644
--- a/Documentation/media/uapi/dvb/video-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/video-fclose.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-fopen.rst b/Documentation/userspace-api/media/dvb/video-fopen.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/video-fopen.rst
rename to Documentation/userspace-api/media/dvb/video-fopen.rst
index 7b2a8c750e6a..a418cf6d772e 100644
--- a/Documentation/media/uapi/dvb/video-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/video-fopen.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-freeze.rst b/Documentation/userspace-api/media/dvb/video-freeze.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-freeze.rst
rename to Documentation/userspace-api/media/dvb/video-freeze.rst
index 6b31a4755d2c..46f287faa7fe 100644
--- a/Documentation/media/uapi/dvb/video-freeze.rst
+++ b/Documentation/userspace-api/media/dvb/video-freeze.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-fwrite.rst b/Documentation/userspace-api/media/dvb/video-fwrite.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-fwrite.rst
rename to Documentation/userspace-api/media/dvb/video-fwrite.rst
index eb35b79eb85c..08dfafa9c6a1 100644
--- a/Documentation/media/uapi/dvb/video-fwrite.rst
+++ b/Documentation/userspace-api/media/dvb/video-fwrite.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-get-capabilities.rst b/Documentation/userspace-api/media/dvb/video-get-capabilities.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-get-capabilities.rst
rename to Documentation/userspace-api/media/dvb/video-get-capabilities.rst
index 971fdab70e15..f6f19df5a3b4 100644
--- a/Documentation/media/uapi/dvb/video-get-capabilities.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-capabilities.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-get-event.rst b/Documentation/userspace-api/media/dvb/video-get-event.rst
similarity index 98%
rename from Documentation/media/uapi/dvb/video-get-event.rst
rename to Documentation/userspace-api/media/dvb/video-get-event.rst
index 7f03fbe3d3b0..6db8e6337c4f 100644
--- a/Documentation/media/uapi/dvb/video-get-event.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-event.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-get-frame-count.rst b/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-get-frame-count.rst
rename to Documentation/userspace-api/media/dvb/video-get-frame-count.rst
index ef35da7d4861..4152a42daeb3 100644
--- a/Documentation/media/uapi/dvb/video-get-frame-count.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-get-pts.rst b/Documentation/userspace-api/media/dvb/video-get-pts.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-get-pts.rst
rename to Documentation/userspace-api/media/dvb/video-get-pts.rst
index 86ceefff7834..f957df792ae1 100644
--- a/Documentation/media/uapi/dvb/video-get-pts.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-pts.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-get-size.rst b/Documentation/userspace-api/media/dvb/video-get-size.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-get-size.rst
rename to Documentation/userspace-api/media/dvb/video-get-size.rst
index cc92189d31fd..376745550eb5 100644
--- a/Documentation/media/uapi/dvb/video-get-size.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-size.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-get-status.rst b/Documentation/userspace-api/media/dvb/video-get-status.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/video-get-status.rst
rename to Documentation/userspace-api/media/dvb/video-get-status.rst
index 8bfcf8fc3e19..d0172593e557 100644
--- a/Documentation/media/uapi/dvb/video-get-status.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-status.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-play.rst b/Documentation/userspace-api/media/dvb/video-play.rst
similarity index 95%
rename from Documentation/media/uapi/dvb/video-play.rst
rename to Documentation/userspace-api/media/dvb/video-play.rst
index fb3f4f168814..2b6b4e93bd93 100644
--- a/Documentation/media/uapi/dvb/video-play.rst
+++ b/Documentation/userspace-api/media/dvb/video-play.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-select-source.rst b/Documentation/userspace-api/media/dvb/video-select-source.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/video-select-source.rst
rename to Documentation/userspace-api/media/dvb/video-select-source.rst
index 32cf025356dc..504f768da00c 100644
--- a/Documentation/media/uapi/dvb/video-select-source.rst
+++ b/Documentation/userspace-api/media/dvb/video-select-source.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-set-blank.rst b/Documentation/userspace-api/media/dvb/video-set-blank.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-set-blank.rst
rename to Documentation/userspace-api/media/dvb/video-set-blank.rst
index 901c3c80f167..a2608df94d3e 100644
--- a/Documentation/media/uapi/dvb/video-set-blank.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-blank.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-set-display-format.rst b/Documentation/userspace-api/media/dvb/video-set-display-format.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-set-display-format.rst
rename to Documentation/userspace-api/media/dvb/video-set-display-format.rst
index ffdefa341207..c587b3d15e30 100644
--- a/Documentation/media/uapi/dvb/video-set-display-format.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-display-format.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-set-format.rst b/Documentation/userspace-api/media/dvb/video-set-format.rst
similarity index 97%
rename from Documentation/media/uapi/dvb/video-set-format.rst
rename to Documentation/userspace-api/media/dvb/video-set-format.rst
index 63e60214ab37..ced74edb74eb 100644
--- a/Documentation/media/uapi/dvb/video-set-format.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-format.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-set-streamtype.rst b/Documentation/userspace-api/media/dvb/video-set-streamtype.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-set-streamtype.rst
rename to Documentation/userspace-api/media/dvb/video-set-streamtype.rst
index 845486a6e049..1729bc04e4f7 100644
--- a/Documentation/media/uapi/dvb/video-set-streamtype.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-streamtype.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-slowmotion.rst b/Documentation/userspace-api/media/dvb/video-slowmotion.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-slowmotion.rst
rename to Documentation/userspace-api/media/dvb/video-slowmotion.rst
index 32c934aaf2ba..b8cfba7bbfb3 100644
--- a/Documentation/media/uapi/dvb/video-slowmotion.rst
+++ b/Documentation/userspace-api/media/dvb/video-slowmotion.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-stillpicture.rst b/Documentation/userspace-api/media/dvb/video-stillpicture.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-stillpicture.rst
rename to Documentation/userspace-api/media/dvb/video-stillpicture.rst
index 58035a7630e6..5432619a63a1 100644
--- a/Documentation/media/uapi/dvb/video-stillpicture.rst
+++ b/Documentation/userspace-api/media/dvb/video-stillpicture.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-stop.rst b/Documentation/userspace-api/media/dvb/video-stop.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-stop.rst
rename to Documentation/userspace-api/media/dvb/video-stop.rst
index 732ace05e34b..9a53fe7f2fd0 100644
--- a/Documentation/media/uapi/dvb/video-stop.rst
+++ b/Documentation/userspace-api/media/dvb/video-stop.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video-try-command.rst b/Documentation/userspace-api/media/dvb/video-try-command.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video-try-command.rst
rename to Documentation/userspace-api/media/dvb/video-try-command.rst
index 37ecf8e91eb8..61667952030f 100644
--- a/Documentation/media/uapi/dvb/video-try-command.rst
+++ b/Documentation/userspace-api/media/dvb/video-try-command.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video.rst b/Documentation/userspace-api/media/dvb/video.rst
similarity index 96%
rename from Documentation/media/uapi/dvb/video.rst
rename to Documentation/userspace-api/media/dvb/video.rst
index 6d72ed0e2b2d..537eae1b0723 100644
--- a/Documentation/media/uapi/dvb/video.rst
+++ b/Documentation/userspace-api/media/dvb/video.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video_function_calls.rst b/Documentation/userspace-api/media/dvb/video_function_calls.rst
similarity index 94%
rename from Documentation/media/uapi/dvb/video_function_calls.rst
rename to Documentation/userspace-api/media/dvb/video_function_calls.rst
index 9e8e49e52b19..4902a40d65ba 100644
--- a/Documentation/media/uapi/dvb/video_function_calls.rst
+++ b/Documentation/userspace-api/media/dvb/video_function_calls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/dvb/video_types.rst b/Documentation/userspace-api/media/dvb/video_types.rst
similarity index 99%
rename from Documentation/media/uapi/dvb/video_types.rst
rename to Documentation/userspace-api/media/dvb/video_types.rst
index 2697400ccf62..bdba1d48f647 100644
--- a/Documentation/media/uapi/dvb/video_types.rst
+++ b/Documentation/userspace-api/media/dvb/video_types.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/fdl-appendix.rst b/Documentation/userspace-api/media/fdl-appendix.rst
similarity index 99%
rename from Documentation/media/uapi/fdl-appendix.rst
rename to Documentation/userspace-api/media/fdl-appendix.rst
index 9316b8617502..70c8cda10814 100644
--- a/Documentation/media/uapi/fdl-appendix.rst
+++ b/Documentation/userspace-api/media/fdl-appendix.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/frontend.h.rst.exceptions b/Documentation/userspace-api/media/frontend.h.rst.exceptions
similarity index 100%
rename from Documentation/media/frontend.h.rst.exceptions
rename to Documentation/userspace-api/media/frontend.h.rst.exceptions
diff --git a/Documentation/media/uapi/gen-errors.rst b/Documentation/userspace-api/media/gen-errors.rst
similarity index 98%
rename from Documentation/media/uapi/gen-errors.rst
rename to Documentation/userspace-api/media/gen-errors.rst
index 043c312dc06d..abae4dbed549 100644
--- a/Documentation/media/uapi/gen-errors.rst
+++ b/Documentation/userspace-api/media/gen-errors.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/media_uapi.rst b/Documentation/userspace-api/media/index.rst
similarity index 80%
rename from Documentation/media/media_uapi.rst
rename to Documentation/userspace-api/media/index.rst
index 0753005c7bb4..614310f82395 100644
--- a/Documentation/media/media_uapi.rst
+++ b/Documentation/userspace-api/media/index.rst
@@ -24,10 +24,10 @@ entitled "GNU Free Documentation License".
     :maxdepth: 1
 
     intro
-    uapi/v4l/v4l2
-    uapi/dvb/dvbapi
-    uapi/rc/remote_controllers
-    uapi/mediactl/media-controller
-    uapi/cec/cec-api
-    uapi/gen-errors
-    uapi/fdl-appendix
+    v4l/v4l2
+    dvb/dvbapi
+    rc/remote_controllers
+    mediactl/media-controller
+    cec/cec-api
+    gen-errors
+    fdl-appendix
diff --git a/Documentation/media/intro.rst b/Documentation/userspace-api/media/intro.rst
similarity index 100%
rename from Documentation/media/intro.rst
rename to Documentation/userspace-api/media/intro.rst
diff --git a/Documentation/media/lirc.h.rst.exceptions b/Documentation/userspace-api/media/lirc.h.rst.exceptions
similarity index 100%
rename from Documentation/media/lirc.h.rst.exceptions
rename to Documentation/userspace-api/media/lirc.h.rst.exceptions
diff --git a/Documentation/media/media.h.rst.exceptions b/Documentation/userspace-api/media/media.h.rst.exceptions
similarity index 100%
rename from Documentation/media/media.h.rst.exceptions
rename to Documentation/userspace-api/media/media.h.rst.exceptions
diff --git a/Documentation/media/uapi/mediactl/media-controller-intro.rst b/Documentation/userspace-api/media/mediactl/media-controller-intro.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/media-controller-intro.rst
rename to Documentation/userspace-api/media/mediactl/media-controller-intro.rst
index 281c559c2f3c..1d06ea4c4d09 100644
--- a/Documentation/media/uapi/mediactl/media-controller-intro.rst
+++ b/Documentation/userspace-api/media/mediactl/media-controller-intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-controller-model.rst b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/media-controller-model.rst
rename to Documentation/userspace-api/media/mediactl/media-controller-model.rst
index b6d5902b556d..865e73d934d6 100644
--- a/Documentation/media/uapi/mediactl/media-controller-model.rst
+++ b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-controller.rst b/Documentation/userspace-api/media/mediactl/media-controller.rst
similarity index 95%
rename from Documentation/media/uapi/mediactl/media-controller.rst
rename to Documentation/userspace-api/media/mediactl/media-controller.rst
index 6e624f690331..16bc3ab180d3 100644
--- a/Documentation/media/uapi/mediactl/media-controller.rst
+++ b/Documentation/userspace-api/media/mediactl/media-controller.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-func-close.rst b/Documentation/userspace-api/media/mediactl/media-func-close.rst
similarity index 95%
rename from Documentation/media/uapi/mediactl/media-func-close.rst
rename to Documentation/userspace-api/media/mediactl/media-func-close.rst
index 369ccd4dee56..ceec61c9e7c5 100644
--- a/Documentation/media/uapi/mediactl/media-func-close.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-close.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-func-ioctl.rst b/Documentation/userspace-api/media/mediactl/media-func-ioctl.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/media-func-ioctl.rst
rename to Documentation/userspace-api/media/mediactl/media-func-ioctl.rst
index 9a990d6480f5..629e7be7c5be 100644
--- a/Documentation/media/uapi/mediactl/media-func-ioctl.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-ioctl.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-func-open.rst b/Documentation/userspace-api/media/mediactl/media-func-open.rst
similarity index 96%
rename from Documentation/media/uapi/mediactl/media-func-open.rst
rename to Documentation/userspace-api/media/mediactl/media-func-open.rst
index cd2f840ddf73..4ade1cc5048f 100644
--- a/Documentation/media/uapi/mediactl/media-func-open.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-open.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-funcs.rst b/Documentation/userspace-api/media/mediactl/media-funcs.rst
similarity index 93%
rename from Documentation/media/uapi/mediactl/media-funcs.rst
rename to Documentation/userspace-api/media/mediactl/media-funcs.rst
index 87b65df8252a..085e80e7fbd5 100644
--- a/Documentation/media/uapi/mediactl/media-funcs.rst
+++ b/Documentation/userspace-api/media/mediactl/media-funcs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-header.rst b/Documentation/userspace-api/media/mediactl/media-header.rst
similarity index 90%
rename from Documentation/media/uapi/mediactl/media-header.rst
rename to Documentation/userspace-api/media/mediactl/media-header.rst
index 1cb7c88aeff0..7ff9d24ce65f 100644
--- a/Documentation/media/uapi/mediactl/media-header.rst
+++ b/Documentation/userspace-api/media/mediactl/media-header.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-ioc-device-info.rst b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
similarity index 98%
rename from Documentation/media/uapi/mediactl/media-ioc-device-info.rst
rename to Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
index f8038cfb708c..9c729bdc8e85 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-device-info.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst b/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
similarity index 98%
rename from Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst
rename to Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
index 33e2b110145c..1d01de8e0f97 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst b/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
similarity index 98%
rename from Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
rename to Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
index b827ebc398f8..9929b639db97 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-ioc-g-topology.rst b/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
similarity index 99%
rename from Documentation/media/uapi/mediactl/media-ioc-g-topology.rst
rename to Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
index 0a7d76ac8ded..54e3112a3b5a 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-g-topology.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst b/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
similarity index 98%
rename from Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst
rename to Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
index 6d4ca4ada2e0..82f86466c7f2 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/media-ioc-setup-link.rst
rename to Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
index ae39dbbe48a0..7da3d0028285 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-setup-link.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-request-ioc-queue.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
similarity index 98%
rename from Documentation/media/uapi/mediactl/media-request-ioc-queue.rst
rename to Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
index fc8458746d51..ad55b6b32616 100644
--- a/Documentation/media/uapi/mediactl/media-request-ioc-queue.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-request-ioc-reinit.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/media-request-ioc-reinit.rst
rename to Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
index 61381e87665a..4c43fa05c8f6 100644
--- a/Documentation/media/uapi/mediactl/media-request-ioc-reinit.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
similarity index 99%
rename from Documentation/media/uapi/mediactl/media-types.rst
rename to Documentation/userspace-api/media/mediactl/media-types.rst
index 3af6a414b501..77fd4c0c9ebc 100644
--- a/Documentation/media/uapi/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/request-api.rst b/Documentation/userspace-api/media/mediactl/request-api.rst
similarity index 99%
rename from Documentation/media/uapi/mediactl/request-api.rst
rename to Documentation/userspace-api/media/mediactl/request-api.rst
index 01abe8103bdd..37d9442a541e 100644
--- a/Documentation/media/uapi/mediactl/request-api.rst
+++ b/Documentation/userspace-api/media/mediactl/request-api.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/request-func-close.rst b/Documentation/userspace-api/media/mediactl/request-func-close.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/request-func-close.rst
rename to Documentation/userspace-api/media/mediactl/request-func-close.rst
index 2cff7770558e..9618b5139764 100644
--- a/Documentation/media/uapi/mediactl/request-func-close.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-close.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/request-func-ioctl.rst b/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
similarity index 97%
rename from Documentation/media/uapi/mediactl/request-func-ioctl.rst
rename to Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
index de0781c61873..4bf985205bcc 100644
--- a/Documentation/media/uapi/mediactl/request-func-ioctl.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/mediactl/request-func-poll.rst b/Documentation/userspace-api/media/mediactl/request-func-poll.rst
similarity index 98%
rename from Documentation/media/uapi/mediactl/request-func-poll.rst
rename to Documentation/userspace-api/media/mediactl/request-func-poll.rst
index ebaf33e21873..85a3427e5913 100644
--- a/Documentation/media/uapi/mediactl/request-func-poll.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-poll.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/net.h.rst.exceptions b/Documentation/userspace-api/media/net.h.rst.exceptions
similarity index 100%
rename from Documentation/media/net.h.rst.exceptions
rename to Documentation/userspace-api/media/net.h.rst.exceptions
diff --git a/Documentation/media/uapi/rc/keytable.c.rst b/Documentation/userspace-api/media/rc/keytable.c.rst
similarity index 98%
rename from Documentation/media/uapi/rc/keytable.c.rst
rename to Documentation/userspace-api/media/rc/keytable.c.rst
index 46f98569e999..901d33d37843 100644
--- a/Documentation/media/uapi/rc/keytable.c.rst
+++ b/Documentation/userspace-api/media/rc/keytable.c.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-dev-intro.rst b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
similarity index 99%
rename from Documentation/media/uapi/rc/lirc-dev-intro.rst
rename to Documentation/userspace-api/media/rc/lirc-dev-intro.rst
index b68c01693939..0c3d70ded55d 100644
--- a/Documentation/media/uapi/rc/lirc-dev-intro.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-dev.rst b/Documentation/userspace-api/media/rc/lirc-dev.rst
similarity index 90%
rename from Documentation/media/uapi/rc/lirc-dev.rst
rename to Documentation/userspace-api/media/rc/lirc-dev.rst
index 7058e0b2296a..7a395fa52934 100644
--- a/Documentation/media/uapi/rc/lirc-dev.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-func.rst b/Documentation/userspace-api/media/rc/lirc-func.rst
similarity index 94%
rename from Documentation/media/uapi/rc/lirc-func.rst
rename to Documentation/userspace-api/media/rc/lirc-func.rst
index 25058369f724..e37c99583212 100644
--- a/Documentation/media/uapi/rc/lirc-func.rst
+++ b/Documentation/userspace-api/media/rc/lirc-func.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-get-features.rst b/Documentation/userspace-api/media/rc/lirc-get-features.rst
similarity index 98%
rename from Documentation/media/uapi/rc/lirc-get-features.rst
rename to Documentation/userspace-api/media/rc/lirc-get-features.rst
index 1d590df8164a..f4b9ca09f828 100644
--- a/Documentation/media/uapi/rc/lirc-get-features.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-features.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-get-rec-mode.rst b/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-get-rec-mode.rst
rename to Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
index 0a3e02aca80e..674ce16d5d33 100644
--- a/Documentation/media/uapi/rc/lirc-get-rec-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-get-rec-resolution.rst b/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-get-rec-resolution.rst
rename to Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
index f560b694ccf2..f20b5bf41232 100644
--- a/Documentation/media/uapi/rc/lirc-get-rec-resolution.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-get-send-mode.rst b/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-get-send-mode.rst
rename to Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
index 4f440c697052..973a47bf6068 100644
--- a/Documentation/media/uapi/rc/lirc-get-send-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-get-timeout.rst b/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-get-timeout.rst
rename to Documentation/userspace-api/media/rc/lirc-get-timeout.rst
index 1de214529f27..5db84096d7f8 100644
--- a/Documentation/media/uapi/rc/lirc-get-timeout.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-header.rst b/Documentation/userspace-api/media/rc/lirc-header.rst
similarity index 90%
rename from Documentation/media/uapi/rc/lirc-header.rst
rename to Documentation/userspace-api/media/rc/lirc-header.rst
index c9b4f33e1031..c7e0716da159 100644
--- a/Documentation/media/uapi/rc/lirc-header.rst
+++ b/Documentation/userspace-api/media/rc/lirc-header.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-read.rst b/Documentation/userspace-api/media/rc/lirc-read.rst
similarity index 97%
rename from Documentation/media/uapi/rc/lirc-read.rst
rename to Documentation/userspace-api/media/rc/lirc-read.rst
index 256e520bc27e..13f7f5353851 100644
--- a/Documentation/media/uapi/rc/lirc-read.rst
+++ b/Documentation/userspace-api/media/rc/lirc-read.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-measure-carrier-mode.rst b/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-set-measure-carrier-mode.rst
rename to Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
index c80acd85e369..4cf9472eb904 100644
--- a/Documentation/media/uapi/rc/lirc-set-measure-carrier-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-rec-carrier-range.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-set-rec-carrier-range.rst
rename to Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
index 443681d5cc10..0439e93aa267 100644
--- a/Documentation/media/uapi/rc/lirc-set-rec-carrier-range.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-rec-carrier.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
similarity index 95%
rename from Documentation/media/uapi/rc/lirc-set-rec-carrier.rst
rename to Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
index cbe1e48b2a4a..f4d18897cb9f 100644
--- a/Documentation/media/uapi/rc/lirc-set-rec-carrier.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-rec-timeout-reports.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-set-rec-timeout-reports.rst
rename to Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
index d06d69414c1e..ab97f87fa757 100644
--- a/Documentation/media/uapi/rc/lirc-set-rec-timeout-reports.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-rec-timeout.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-set-rec-timeout.rst
rename to Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
index 163ac6065737..227776cf7c62 100644
--- a/Documentation/media/uapi/rc/lirc-set-rec-timeout.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-send-carrier.rst b/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
similarity index 95%
rename from Documentation/media/uapi/rc/lirc-set-send-carrier.rst
rename to Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
index cffc6c1e15cc..7eaf2b993207 100644
--- a/Documentation/media/uapi/rc/lirc-set-send-carrier.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-send-duty-cycle.rst b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-set-send-duty-cycle.rst
rename to Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
index 08ab3d1a96cd..0dee89364cde 100644
--- a/Documentation/media/uapi/rc/lirc-set-send-duty-cycle.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-transmitter-mask.rst b/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
similarity index 96%
rename from Documentation/media/uapi/rc/lirc-set-transmitter-mask.rst
rename to Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
index 889a739eaf0d..dcee4b71dcf6 100644
--- a/Documentation/media/uapi/rc/lirc-set-transmitter-mask.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-set-wideband-receiver.rst b/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
similarity index 97%
rename from Documentation/media/uapi/rc/lirc-set-wideband-receiver.rst
rename to Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
index 592715452fce..22f6fe43b7e7 100644
--- a/Documentation/media/uapi/rc/lirc-set-wideband-receiver.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/lirc-write.rst b/Documentation/userspace-api/media/rc/lirc-write.rst
similarity index 97%
rename from Documentation/media/uapi/rc/lirc-write.rst
rename to Documentation/userspace-api/media/rc/lirc-write.rst
index eafe13203ea3..96ca4a22062e 100644
--- a/Documentation/media/uapi/rc/lirc-write.rst
+++ b/Documentation/userspace-api/media/rc/lirc-write.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/rc-intro.rst b/Documentation/userspace-api/media/rc/rc-intro.rst
similarity index 95%
rename from Documentation/media/uapi/rc/rc-intro.rst
rename to Documentation/userspace-api/media/rc/rc-intro.rst
index 37c5f90c76e7..14e85157bf23 100644
--- a/Documentation/media/uapi/rc/rc-intro.rst
+++ b/Documentation/userspace-api/media/rc/rc-intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/rc-protos.rst b/Documentation/userspace-api/media/rc/rc-protos.rst
similarity index 100%
rename from Documentation/media/uapi/rc/rc-protos.rst
rename to Documentation/userspace-api/media/rc/rc-protos.rst
diff --git a/Documentation/media/uapi/rc/rc-sysfs-nodes.rst b/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
similarity index 98%
rename from Documentation/media/uapi/rc/rc-sysfs-nodes.rst
rename to Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
index b8e8319e3317..73dd75f77d65 100644
--- a/Documentation/media/uapi/rc/rc-sysfs-nodes.rst
+++ b/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/rc-table-change.rst b/Documentation/userspace-api/media/rc/rc-table-change.rst
similarity index 93%
rename from Documentation/media/uapi/rc/rc-table-change.rst
rename to Documentation/userspace-api/media/rc/rc-table-change.rst
index 4a2e601b89fb..f5d00a20b939 100644
--- a/Documentation/media/uapi/rc/rc-table-change.rst
+++ b/Documentation/userspace-api/media/rc/rc-table-change.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/rc-tables.rst b/Documentation/userspace-api/media/rc/rc-tables.rst
similarity index 99%
rename from Documentation/media/uapi/rc/rc-tables.rst
rename to Documentation/userspace-api/media/rc/rc-tables.rst
index 20d7c686922b..33b724b17ff3 100644
--- a/Documentation/media/uapi/rc/rc-tables.rst
+++ b/Documentation/userspace-api/media/rc/rc-tables.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/rc/remote_controllers.rst b/Documentation/userspace-api/media/rc/remote_controllers.rst
similarity index 95%
rename from Documentation/media/uapi/rc/remote_controllers.rst
rename to Documentation/userspace-api/media/rc/remote_controllers.rst
index 20e0f986df49..3ab2d6db1564 100644
--- a/Documentation/media/uapi/rc/remote_controllers.rst
+++ b/Documentation/userspace-api/media/rc/remote_controllers.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/typical_media_device.svg b/Documentation/userspace-api/media/typical_media_device.svg
similarity index 99%
rename from Documentation/media/typical_media_device.svg
rename to Documentation/userspace-api/media/typical_media_device.svg
index bfd5c7db3b00..3420341ff7b6 100644
--- a/Documentation/media/typical_media_device.svg
+++ b/Documentation/userspace-api/media/typical_media_device.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/app-pri.rst b/Documentation/userspace-api/media/v4l/app-pri.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/app-pri.rst
rename to Documentation/userspace-api/media/v4l/app-pri.rst
index c25c1271b4f6..5018ede2706f 100644
--- a/Documentation/media/uapi/v4l/app-pri.rst
+++ b/Documentation/userspace-api/media/v4l/app-pri.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/async.rst b/Documentation/userspace-api/media/v4l/async.rst
similarity index 90%
rename from Documentation/media/uapi/v4l/async.rst
rename to Documentation/userspace-api/media/v4l/async.rst
index be9539313f60..8bc4a726c95e 100644
--- a/Documentation/media/uapi/v4l/async.rst
+++ b/Documentation/userspace-api/media/v4l/async.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/audio.rst b/Documentation/userspace-api/media/v4l/audio.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/audio.rst
rename to Documentation/userspace-api/media/v4l/audio.rst
index 4c7fdbc8a860..d6bb85092e02 100644
--- a/Documentation/media/uapi/v4l/audio.rst
+++ b/Documentation/userspace-api/media/v4l/audio.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/bayer.svg b/Documentation/userspace-api/media/v4l/bayer.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/bayer.svg
rename to Documentation/userspace-api/media/v4l/bayer.svg
index c5bf85103901..82e805c68c1f 100644
--- a/Documentation/media/uapi/v4l/bayer.svg
+++ b/Documentation/userspace-api/media/v4l/bayer.svg
@@ -22,7 +22,7 @@
        Version 1.1 or any later version published by the Free Software
        Foundation, with no Invariant Sections, no Front-Cover Texts
        and no Back-Cover Texts. A copy of the license is included at
-       Documentation/media/uapi/fdl-appendix.rst.
+       Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/biblio.rst
rename to Documentation/userspace-api/media/v4l/biblio.rst
index 8095f57d3d75..3c9634173e82 100644
--- a/Documentation/media/uapi/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/buffer.rst
rename to Documentation/userspace-api/media/v4l/buffer.rst
index 3112300c2fa0..951ae1ed485f 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/capture-example.rst b/Documentation/userspace-api/media/v4l/capture-example.rst
similarity index 90%
rename from Documentation/media/uapi/v4l/capture-example.rst
rename to Documentation/userspace-api/media/v4l/capture-example.rst
index 130ca47ef796..6aa67c5aff8f 100644
--- a/Documentation/media/uapi/v4l/capture-example.rst
+++ b/Documentation/userspace-api/media/v4l/capture-example.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/capture.c.rst b/Documentation/userspace-api/media/v4l/capture.c.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/capture.c.rst
rename to Documentation/userspace-api/media/v4l/capture.c.rst
index b4652c2351f2..30f7c816e858 100644
--- a/Documentation/media/uapi/v4l/capture.c.rst
+++ b/Documentation/userspace-api/media/v4l/capture.c.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/colorspaces-defs.rst b/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/colorspaces-defs.rst
rename to Documentation/userspace-api/media/v4l/colorspaces-defs.rst
index e122bbe3d799..01404e1f609a 100644
--- a/Documentation/media/uapi/v4l/colorspaces-defs.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/colorspaces-details.rst b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/colorspaces-details.rst
rename to Documentation/userspace-api/media/v4l/colorspaces-details.rst
index 8b0ba3668101..79ed6f4f76eb 100644
--- a/Documentation/media/uapi/v4l/colorspaces-details.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/colorspaces.rst b/Documentation/userspace-api/media/v4l/colorspaces.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/colorspaces.rst
rename to Documentation/userspace-api/media/v4l/colorspaces.rst
index 4f6c82fa057f..0846df9066c5 100644
--- a/Documentation/media/uapi/v4l/colorspaces.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/common-defs.rst b/Documentation/userspace-api/media/v4l/common-defs.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/common-defs.rst
rename to Documentation/userspace-api/media/v4l/common-defs.rst
index 504c6c93c9b0..370a1e364a51 100644
--- a/Documentation/media/uapi/v4l/common-defs.rst
+++ b/Documentation/userspace-api/media/v4l/common-defs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/common.rst
rename to Documentation/userspace-api/media/v4l/common.rst
index 5e87ae24e4b4..af28ac1bcf88 100644
--- a/Documentation/media/uapi/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/compat.rst b/Documentation/userspace-api/media/v4l/compat.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/compat.rst
rename to Documentation/userspace-api/media/v4l/compat.rst
index f35575a300b4..055286b86e9b 100644
--- a/Documentation/media/uapi/v4l/compat.rst
+++ b/Documentation/userspace-api/media/v4l/compat.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/constraints.svg b/Documentation/userspace-api/media/v4l/constraints.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/constraints.svg
rename to Documentation/userspace-api/media/v4l/constraints.svg
index 08f9f8b0985e..1dfe51a9839d 100644
--- a/Documentation/media/uapi/v4l/constraints.svg
+++ b/Documentation/userspace-api/media/v4l/constraints.svg
@@ -22,7 +22,7 @@
        Version 1.1 or any later version published by the Free Software
        Foundation, with no Invariant Sections, no Front-Cover Texts
        and no Back-Cover Texts. A copy of the license is included at
-       Documentation/media/uapi/fdl-appendix.rst.
+       Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/control.rst
rename to Documentation/userspace-api/media/v4l/control.rst
index ef62e088ff7a..3e991c1f7a12 100644
--- a/Documentation/media/uapi/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/crop.rst b/Documentation/userspace-api/media/v4l/crop.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/crop.rst
rename to Documentation/userspace-api/media/v4l/crop.rst
index ada7c22e6291..cb7e2341aedf 100644
--- a/Documentation/media/uapi/v4l/crop.rst
+++ b/Documentation/userspace-api/media/v4l/crop.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/crop.svg b/Documentation/userspace-api/media/v4l/crop.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/crop.svg
rename to Documentation/userspace-api/media/v4l/crop.svg
index 32d72598d135..4cd47f98e7c8 100644
--- a/Documentation/media/uapi/v4l/crop.svg
+++ b/Documentation/userspace-api/media/v4l/crop.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/depth-formats.rst b/Documentation/userspace-api/media/v4l/depth-formats.rst
similarity index 91%
rename from Documentation/media/uapi/v4l/depth-formats.rst
rename to Documentation/userspace-api/media/v4l/depth-formats.rst
index 1bfd0b82cb85..6742486a83b5 100644
--- a/Documentation/media/uapi/v4l/depth-formats.rst
+++ b/Documentation/userspace-api/media/v4l/depth-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-capture.rst b/Documentation/userspace-api/media/v4l/dev-capture.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/dev-capture.rst
rename to Documentation/userspace-api/media/v4l/dev-capture.rst
index 134e22b32338..44d3094093ab 100644
--- a/Documentation/media/uapi/v4l/dev-capture.rst
+++ b/Documentation/userspace-api/media/v4l/dev-capture.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
similarity index 100%
rename from Documentation/media/uapi/v4l/dev-decoder.rst
rename to Documentation/userspace-api/media/v4l/dev-decoder.rst
diff --git a/Documentation/media/uapi/v4l/dev-event.rst b/Documentation/userspace-api/media/v4l/dev-event.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/dev-event.rst
rename to Documentation/userspace-api/media/v4l/dev-event.rst
index 6029101fe1d7..d09034fd680a 100644
--- a/Documentation/media/uapi/v4l/dev-event.rst
+++ b/Documentation/userspace-api/media/v4l/dev-event.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/dev-mem2mem.rst
rename to Documentation/userspace-api/media/v4l/dev-mem2mem.rst
index 70953958cee6..9279d87c08a1 100644
--- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
+++ b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/dev-meta.rst
rename to Documentation/userspace-api/media/v4l/dev-meta.rst
index c5dbe882be65..6d2c5a79b370 100644
--- a/Documentation/media/uapi/v4l/dev-meta.rst
+++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-osd.rst b/Documentation/userspace-api/media/v4l/dev-osd.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dev-osd.rst
rename to Documentation/userspace-api/media/v4l/dev-osd.rst
index d3ad67da6386..67dc46373a91 100644
--- a/Documentation/media/uapi/v4l/dev-osd.rst
+++ b/Documentation/userspace-api/media/v4l/dev-osd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-output.rst b/Documentation/userspace-api/media/v4l/dev-output.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/dev-output.rst
rename to Documentation/userspace-api/media/v4l/dev-output.rst
index 3fe1b39696ed..e4f2a1d8b0fc 100644
--- a/Documentation/media/uapi/v4l/dev-output.rst
+++ b/Documentation/userspace-api/media/v4l/dev-output.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-overlay.rst b/Documentation/userspace-api/media/v4l/dev-overlay.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dev-overlay.rst
rename to Documentation/userspace-api/media/v4l/dev-overlay.rst
index b91b3837d4e7..7246d560173d 100644
--- a/Documentation/media/uapi/v4l/dev-overlay.rst
+++ b/Documentation/userspace-api/media/v4l/dev-overlay.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-radio.rst b/Documentation/userspace-api/media/v4l/dev-radio.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/dev-radio.rst
rename to Documentation/userspace-api/media/v4l/dev-radio.rst
index 133eb0e788c2..c0edd7b7d201 100644
--- a/Documentation/media/uapi/v4l/dev-radio.rst
+++ b/Documentation/userspace-api/media/v4l/dev-radio.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dev-raw-vbi.rst
rename to Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
index e06b03ca2ab2..0307d44e17cb 100644
--- a/Documentation/media/uapi/v4l/dev-raw-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-rds.rst b/Documentation/userspace-api/media/v4l/dev-rds.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dev-rds.rst
rename to Documentation/userspace-api/media/v4l/dev-rds.rst
index 64a724ef58f5..13dba4a4180c 100644
--- a/Documentation/media/uapi/v4l/dev-rds.rst
+++ b/Documentation/userspace-api/media/v4l/dev-rds.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-sdr.rst b/Documentation/userspace-api/media/v4l/dev-sdr.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/dev-sdr.rst
rename to Documentation/userspace-api/media/v4l/dev-sdr.rst
index 75595c58cb5b..c9563bca444e 100644
--- a/Documentation/media/uapi/v4l/dev-sdr.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sdr.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dev-sliced-vbi.rst
rename to Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 7b2d38dd402a..0767299e9105 100644
--- a/Documentation/media/uapi/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
similarity index 100%
rename from Documentation/media/uapi/v4l/dev-stateless-decoder.rst
rename to Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
diff --git a/Documentation/media/uapi/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dev-subdev.rst
rename to Documentation/userspace-api/media/v4l/dev-subdev.rst
index 029bb2d9928a..0c1a5f50ee21 100644
--- a/Documentation/media/uapi/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dev-touch.rst b/Documentation/userspace-api/media/v4l/dev-touch.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/dev-touch.rst
rename to Documentation/userspace-api/media/v4l/dev-touch.rst
index 356f01385221..c1ce446274f2 100644
--- a/Documentation/media/uapi/v4l/dev-touch.rst
+++ b/Documentation/userspace-api/media/v4l/dev-touch.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/devices.rst b/Documentation/userspace-api/media/v4l/devices.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/devices.rst
rename to Documentation/userspace-api/media/v4l/devices.rst
index 07f8d047662b..47ffe90753dd 100644
--- a/Documentation/media/uapi/v4l/devices.rst
+++ b/Documentation/userspace-api/media/v4l/devices.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/diff-v4l.rst b/Documentation/userspace-api/media/v4l/diff-v4l.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/diff-v4l.rst
rename to Documentation/userspace-api/media/v4l/diff-v4l.rst
index dd6739e8a5b2..37644d26c4ae 100644
--- a/Documentation/media/uapi/v4l/diff-v4l.rst
+++ b/Documentation/userspace-api/media/v4l/diff-v4l.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dmabuf.rst b/Documentation/userspace-api/media/v4l/dmabuf.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/dmabuf.rst
rename to Documentation/userspace-api/media/v4l/dmabuf.rst
index bb8fd943b14e..342421ff9497 100644
--- a/Documentation/media/uapi/v4l/dmabuf.rst
+++ b/Documentation/userspace-api/media/v4l/dmabuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/dv-timings.rst b/Documentation/userspace-api/media/v4l/dv-timings.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/dv-timings.rst
rename to Documentation/userspace-api/media/v4l/dv-timings.rst
index b3c69ca559e2..e216aa9edef0 100644
--- a/Documentation/media/uapi/v4l/dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/dv-timings.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/ext-ctrls-camera.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 51c1d5c9eb00..e39f84d2447f 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/ext-ctrls-codec.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d4fc5f25aa14..f64f6fc4fd75 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-detect.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/ext-ctrls-detect.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst
index 80981d0cff42..77a4992f26bd 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-detect.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-dv.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/ext-ctrls-dv.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
index 5c70ac98f710..c572b65dc772 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-dv.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/ext-ctrls-flash.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index b9a6b08fbf32..5053a380f7de 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-fm-rx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/ext-ctrls-fm-rx.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
index 3ed6dd7f586d..69197bbe23dd 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-fm-rx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-fm-tx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/ext-ctrls-fm-tx.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
index db88346d99fd..c13ec0a6af3a 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-fm-tx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/ext-ctrls-image-process.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 22fc2d3e433d..e47103aa32ed 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 2d3e2b83d6dd..7b75158aca4d 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
index 60ce3f949319..5ea69978f3ea 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-rf-tuner.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/ext-ctrls-rf-tuner.rst
rename to Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst
index 0fb85ba878dd..5277138fce67 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-rf-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/userspace-api/media/v4l/extended-controls.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/extended-controls.rst
rename to Documentation/userspace-api/media/v4l/extended-controls.rst
index 655362483730..9aa352ac5ea4 100644
--- a/Documentation/media/uapi/v4l/extended-controls.rst
+++ b/Documentation/userspace-api/media/v4l/extended-controls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/field-order.rst b/Documentation/userspace-api/media/v4l/field-order.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/field-order.rst
rename to Documentation/userspace-api/media/v4l/field-order.rst
index c422bebe4314..04e9a6932dc5 100644
--- a/Documentation/media/uapi/v4l/field-order.rst
+++ b/Documentation/userspace-api/media/v4l/field-order.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/fieldseq_bt.svg b/Documentation/userspace-api/media/v4l/fieldseq_bt.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/fieldseq_bt.svg
rename to Documentation/userspace-api/media/v4l/fieldseq_bt.svg
index 1dab1cd1b6de..b663f6fcb70b 100644
--- a/Documentation/media/uapi/v4l/fieldseq_bt.svg
+++ b/Documentation/userspace-api/media/v4l/fieldseq_bt.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/fieldseq_tb.svg b/Documentation/userspace-api/media/v4l/fieldseq_tb.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/fieldseq_tb.svg
rename to Documentation/userspace-api/media/v4l/fieldseq_tb.svg
index 041071e43f9b..f8b440a1cb60 100644
--- a/Documentation/media/uapi/v4l/fieldseq_tb.svg
+++ b/Documentation/userspace-api/media/v4l/fieldseq_tb.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/format.rst b/Documentation/userspace-api/media/v4l/format.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/format.rst
rename to Documentation/userspace-api/media/v4l/format.rst
index 9cdb296333b8..e47fc0505727 100644
--- a/Documentation/media/uapi/v4l/format.rst
+++ b/Documentation/userspace-api/media/v4l/format.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-close.rst b/Documentation/userspace-api/media/v4l/func-close.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/func-close.rst
rename to Documentation/userspace-api/media/v4l/func-close.rst
index 1a56811b827e..37a64dae56b0 100644
--- a/Documentation/media/uapi/v4l/func-close.rst
+++ b/Documentation/userspace-api/media/v4l/func-close.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-ioctl.rst b/Documentation/userspace-api/media/v4l/func-ioctl.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/func-ioctl.rst
rename to Documentation/userspace-api/media/v4l/func-ioctl.rst
index e7a8cf62752e..4e69f303636b 100644
--- a/Documentation/media/uapi/v4l/func-ioctl.rst
+++ b/Documentation/userspace-api/media/v4l/func-ioctl.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-mmap.rst b/Documentation/userspace-api/media/v4l/func-mmap.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/func-mmap.rst
rename to Documentation/userspace-api/media/v4l/func-mmap.rst
index 75985d80788a..f9c77bdce434 100644
--- a/Documentation/media/uapi/v4l/func-mmap.rst
+++ b/Documentation/userspace-api/media/v4l/func-mmap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-munmap.rst b/Documentation/userspace-api/media/v4l/func-munmap.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/func-munmap.rst
rename to Documentation/userspace-api/media/v4l/func-munmap.rst
index 0d472d86a036..18a9941b47ab 100644
--- a/Documentation/media/uapi/v4l/func-munmap.rst
+++ b/Documentation/userspace-api/media/v4l/func-munmap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-open.rst b/Documentation/userspace-api/media/v4l/func-open.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/func-open.rst
rename to Documentation/userspace-api/media/v4l/func-open.rst
index a3d149ce6635..8bcdec8ab387 100644
--- a/Documentation/media/uapi/v4l/func-open.rst
+++ b/Documentation/userspace-api/media/v4l/func-open.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-poll.rst b/Documentation/userspace-api/media/v4l/func-poll.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/func-poll.rst
rename to Documentation/userspace-api/media/v4l/func-poll.rst
index 4c579ed31358..2c6704c1fab7 100644
--- a/Documentation/media/uapi/v4l/func-poll.rst
+++ b/Documentation/userspace-api/media/v4l/func-poll.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-read.rst b/Documentation/userspace-api/media/v4l/func-read.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/func-read.rst
rename to Documentation/userspace-api/media/v4l/func-read.rst
index 14aca4d5e8fd..1728aa5d8313 100644
--- a/Documentation/media/uapi/v4l/func-read.rst
+++ b/Documentation/userspace-api/media/v4l/func-read.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-select.rst b/Documentation/userspace-api/media/v4l/func-select.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/func-select.rst
rename to Documentation/userspace-api/media/v4l/func-select.rst
index af5f1e31c0fb..6aca8a290c1f 100644
--- a/Documentation/media/uapi/v4l/func-select.rst
+++ b/Documentation/userspace-api/media/v4l/func-select.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/func-write.rst b/Documentation/userspace-api/media/v4l/func-write.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/func-write.rst
rename to Documentation/userspace-api/media/v4l/func-write.rst
index 865129c726ad..fb1955f70f0f 100644
--- a/Documentation/media/uapi/v4l/func-write.rst
+++ b/Documentation/userspace-api/media/v4l/func-write.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/hist-v4l2.rst
rename to Documentation/userspace-api/media/v4l/hist-v4l2.rst
index 9e097f34cb74..7913d017cd33 100644
--- a/Documentation/media/uapi/v4l/hist-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/hsv-formats.rst b/Documentation/userspace-api/media/v4l/hsv-formats.rst
similarity index 93%
rename from Documentation/media/uapi/v4l/hsv-formats.rst
rename to Documentation/userspace-api/media/v4l/hsv-formats.rst
index f52f8ba131f0..4906f7e0d80d 100644
--- a/Documentation/media/uapi/v4l/hsv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/hsv-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/io.rst b/Documentation/userspace-api/media/v4l/io.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/io.rst
rename to Documentation/userspace-api/media/v4l/io.rst
index 049a2530d3a2..de0e2f529268 100644
--- a/Documentation/media/uapi/v4l/io.rst
+++ b/Documentation/userspace-api/media/v4l/io.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/libv4l-introduction.rst b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/libv4l-introduction.rst
rename to Documentation/userspace-api/media/v4l/libv4l-introduction.rst
index 1b206d380d4b..95f3127b4749 100644
--- a/Documentation/media/uapi/v4l/libv4l-introduction.rst
+++ b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/libv4l.rst b/Documentation/userspace-api/media/v4l/libv4l.rst
similarity index 90%
rename from Documentation/media/uapi/v4l/libv4l.rst
rename to Documentation/userspace-api/media/v4l/libv4l.rst
index d114fbf1ffa6..5ea2016cac65 100644
--- a/Documentation/media/uapi/v4l/libv4l.rst
+++ b/Documentation/userspace-api/media/v4l/libv4l.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/meta-formats.rst
rename to Documentation/userspace-api/media/v4l/meta-formats.rst
index 74c8659ee9d6..7dcc4bacbb0c 100644
--- a/Documentation/media/uapi/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/mmap.rst b/Documentation/userspace-api/media/v4l/mmap.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/mmap.rst
rename to Documentation/userspace-api/media/v4l/mmap.rst
index c47708bf2c87..9c44d05ebc3f 100644
--- a/Documentation/media/uapi/v4l/mmap.rst
+++ b/Documentation/userspace-api/media/v4l/mmap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/nv12mt.svg b/Documentation/userspace-api/media/v4l/nv12mt.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/nv12mt.svg
rename to Documentation/userspace-api/media/v4l/nv12mt.svg
index 067d8fb34ba2..d4bb4eb83f6a 100644
--- a/Documentation/media/uapi/v4l/nv12mt.svg
+++ b/Documentation/userspace-api/media/v4l/nv12mt.svg
@@ -22,7 +22,7 @@
        Version 1.1 or any later version published by the Free Software
        Foundation, with no Invariant Sections, no Front-Cover Texts
        and no Back-Cover Texts. A copy of the license is included at
-       Documentation/media/uapi/fdl-appendix.rst.
+       Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/nv12mt_example.svg b/Documentation/userspace-api/media/v4l/nv12mt_example.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/nv12mt_example.svg
rename to Documentation/userspace-api/media/v4l/nv12mt_example.svg
index 70c3200fdb32..e5075af9f45a 100644
--- a/Documentation/media/uapi/v4l/nv12mt_example.svg
+++ b/Documentation/userspace-api/media/v4l/nv12mt_example.svg
@@ -22,7 +22,7 @@
        Version 1.1 or any later version published by the Free Software
        Foundation, with no Invariant Sections, no Front-Cover Texts
        and no Back-Cover Texts. A copy of the license is included at
-       Documentation/media/uapi/fdl-appendix.rst.
+       Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/open.rst
rename to Documentation/userspace-api/media/v4l/open.rst
index 42fad5001c5c..38046ef20141 100644
--- a/Documentation/media/uapi/v4l/open.rst
+++ b/Documentation/userspace-api/media/v4l/open.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pipeline.dot b/Documentation/userspace-api/media/v4l/pipeline.dot
similarity index 100%
rename from Documentation/media/uapi/v4l/pipeline.dot
rename to Documentation/userspace-api/media/v4l/pipeline.dot
diff --git a/Documentation/media/uapi/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-bayer.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index cfa2f4e3e114..9c3c56251b49 100644
--- a/Documentation/media/uapi/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-cnf4.rst b/Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst
similarity index 100%
rename from Documentation/media/uapi/v4l/pixfmt-cnf4.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst
diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-compressed.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 561bda112809..3828bb79225d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-grey.rst b/Documentation/userspace-api/media/v4l/pixfmt-grey.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-grey.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-grey.rst
index 3a8156164d39..7b03db3393be 100644
--- a/Documentation/media/uapi/v4l/pixfmt-grey.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-grey.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-indexed.rst b/Documentation/userspace-api/media/v4l/pixfmt-indexed.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-indexed.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-indexed.rst
index 4538b425a046..d0d46ed27260 100644
--- a/Documentation/media/uapi/v4l/pixfmt-indexed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-indexed.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-intro.rst b/Documentation/userspace-api/media/v4l/pixfmt-intro.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-intro.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-intro.rst
index ca0a6e0d8959..af870895f653 100644
--- a/Documentation/media/uapi/v4l/pixfmt-intro.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-inzi.rst b/Documentation/userspace-api/media/v4l/pixfmt-inzi.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-inzi.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-inzi.rst
index af2940d844ff..f85cccb71741 100644
--- a/Documentation/media/uapi/v4l/pixfmt-inzi.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-inzi.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-m420.rst b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-m420.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-m420.rst
index c2bae959bf51..5180bbe16c6e 100644
--- a/Documentation/media/uapi/v4l/pixfmt-m420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-d4xx.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-meta-d4xx.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
index 87e8fd7d5d02..4eaf2f9086a9 100644
--- a/Documentation/media/uapi/v4l/pixfmt-meta-d4xx.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-meta-intel-ipu3.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
index 7fb54339f4a7..97a9a2925671 100644
--- a/Documentation/media/uapi/v4l/pixfmt-meta-intel-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
@@ -19,7 +19,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-uvc.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-meta-uvc.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst
index 481e4e0e6e1d..debc50285a25 100644
--- a/Documentation/media/uapi/v4l/pixfmt-meta-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
index eed20eaefe24..34a2382ef91c 100644
--- a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
@@ -20,7 +20,7 @@
 ..    Version 1.1 or any later version published by the Free Software
 ..    Foundation, with no Invariant Sections, no Front-Cover Texts
 ..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/media/uapi/fdl-appendix.rst.
+..    Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgo.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgo.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst
index f7a861696281..b780e447dd4b 100644
--- a/Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgo.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst
index d1a341af9c48..e165320cc1ff 100644
--- a/Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-nv12.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-nv12.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
index b8c021b07fd2..19d47b38e02a 100644
--- a/Documentation/media/uapi/v4l/pixfmt-nv12.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-nv12m.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-nv12m.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
index 9b2c5c21280a..115ea603c13f 100644
--- a/Documentation/media/uapi/v4l/pixfmt-nv12m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-nv12mt.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-nv12mt.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
index 2092725de33c..daac1c16d4f2 100644
--- a/Documentation/media/uapi/v4l/pixfmt-nv12mt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-nv16.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-nv16.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
index 5ec4b7fa8f04..977636fc98d6 100644
--- a/Documentation/media/uapi/v4l/pixfmt-nv16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-nv16m.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-nv16m.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
index 4a63bcf18b70..cf33942d942d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-nv16m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-nv24.rst b/Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-nv24.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
index 13fc6fe1a3d6..c6fb97bd0472 100644
--- a/Documentation/media/uapi/v4l/pixfmt-nv24.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-packed-hsv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-packed-hsv.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst
index dfc4a8367b3d..b8c9b0225eea 100644
--- a/Documentation/media/uapi/v4l/pixfmt-packed-hsv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 41b60fae703a..bbd4bd094deb 100644
--- a/Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-reserved.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 7d98a7bf9f1f..8ef90b0df864 100644
--- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-rgb.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 4ce305cc45da..b6c0c942d9d1 100644
--- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-cs08.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst
similarity index 94%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-cs08.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst
index e7a89fe7e117..13f3908d162a 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-cs08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-cs14le.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-cs14le.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst
index d10d56f0e63a..41e5b990d499 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-cs14le.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-cu08.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst
similarity index 94%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-cu08.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst
index f37df90f5a21..1085b5ad8eb7 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-cu08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-cu16le.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-cu16le.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst
index 237998fb5f9f..9772b30bda95 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-cu16le.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-pcu16be.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-pcu16be.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst
index df078dcfd18d..53a0a862f33a 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-pcu16be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-pcu18be.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-pcu18be.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst
index a1ea63db9230..7f2d2545fb04 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-pcu18be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-pcu20be.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-pcu20be.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst
index 11a05ea60e26..9f3d67b4e94c 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-pcu20be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-sdr-ru12le.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst
similarity index 94%
rename from Documentation/media/uapi/v4l/pixfmt-sdr-ru12le.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst
index 3c2c9f75fc5e..c9cde8d425f7 100644
--- a/Documentation/media/uapi/v4l/pixfmt-sdr-ru12le.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb10-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-srggb10-ipu3.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
index 75279f0fdad8..5afa02a66698 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb10-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb10.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-srggb10.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst
index cab7fbb1f2fe..37cc1bb8241f 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb10.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb10alaw8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-srggb10alaw8.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst
index 5bb58764b532..f1b8627f0141 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb10alaw8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb10dpcm8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-srggb10dpcm8.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst
index cbc9c0a52ab4..9814c4ffac68 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb10dpcm8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb10p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-srggb10p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
index fd32660a3766..76a4d278e640 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb10p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-srggb12.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst
index 6fb6a937e6ad..98ae80b968ae 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb12.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
index 045540bc0d86..7309dd7fa60f 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-srggb14p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
index 051ae3d05bc3..ec1239ada316 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb16.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-srggb16.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
index 36527c49eaf7..885f0d1f331d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-srggb8.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
index f5233c1e2314..c275e6ef09f9 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-td08.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-tch-td08.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst
index b7d3d6ccebc5..165c9be2bfc5 100644
--- a/Documentation/media/uapi/v4l/pixfmt-tch-td08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst
index 6f1be873bec1..6dca01182175 100644
--- a/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-tu08.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-tch-tu08.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst
index 2d447475aaa7..f1380b72977f 100644
--- a/Documentation/media/uapi/v4l/pixfmt-tch-tu08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst
index cb3da6687a58..2b9e1b15abcf 100644
--- a/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-uv8.rst b/Documentation/userspace-api/media/v4l/pixfmt-uv8.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-uv8.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-uv8.rst
index 6008c898305d..a36c1a4d64a4 100644
--- a/Documentation/media/uapi/v4l/pixfmt-uv8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-uv8.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-uyvy.rst b/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-uyvy.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
index 72da2639d37e..776cb37f76f1 100644
--- a/Documentation/media/uapi/v4l/pixfmt-uyvy.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
index 054275c0dfc1..444b4082684c 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/pixfmt-v4l2.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
index a993b861bf75..759420a872d6 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-vyuy.rst b/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-vyuy.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
index 39b99707cd99..6cd574e78e4c 100644
--- a/Documentation/media/uapi/v4l/pixfmt-vyuy.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y10.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-y10.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y10.rst
index 63277686764a..dfb352ae6784 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y10.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y10.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y10b.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-y10b.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
index 49c4dd432413..b5d89d6d5c52 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y10b.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y10p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-y10p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
index 39cd789dcb59..ffb6e1631b78 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y10p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y12.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt-y12.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y12.rst
index 33a943b4996a..4226c49232de 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y12.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y12.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y12i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12i.rst
similarity index 95%
rename from Documentation/media/uapi/v4l/pixfmt-y12i.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y12i.rst
index 1d4a14e1ec6e..b4752754337b 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y12i.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y12i.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y16-be.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-y16-be.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
index 1e72bfe2d557..f4eda7b95b51 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y16-be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y16.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-y16.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y16.rst
index f77d900db131..a092b0a5ff12 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y16.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y41p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-y41p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
index 829c68afd8d7..211afd7593cc 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y41p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-y8i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y8i.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-y8i.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-y8i.rst
index 2c88ed90522d..4248c6f735b7 100644
--- a/Documentation/media/uapi/v4l/pixfmt-y8i.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y8i.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv410.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv410.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
index ebb72a5c7ceb..1d20115f2b1d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv410.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv411p.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv411p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
index 83ddaa3f8dfb..967ba7ce41a2 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv411p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv420.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv420.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
index f4f6f792a23e..7cb685cc8289 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv420m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv420m.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
index c29b30c6445a..80c14d4f5acb 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv420m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv422m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv422m.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
index 737fd94a9ae9..29b78480ccad 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv422m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv422p.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv422p.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
index 7cebb6ebb621..73fde222d820 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv422p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuv444m.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/pixfmt-yuv444m.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
index 8f14ca378816..7073ac7f842d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuv444m.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yuyv.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-yuyv.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
index d86d7f086c41..fe70e007787d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yuyv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-yvyu.rst b/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-yvyu.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
index 656a830fed02..96c1b537d5a0 100644
--- a/Documentation/media/uapi/v4l/pixfmt-yvyu.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt-z16.rst b/Documentation/userspace-api/media/v4l/pixfmt-z16.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/pixfmt-z16.rst
rename to Documentation/userspace-api/media/v4l/pixfmt-z16.rst
index eccf235bf02d..fe2fb21edeea 100644
--- a/Documentation/media/uapi/v4l/pixfmt-z16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-z16.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/pixfmt.rst
rename to Documentation/userspace-api/media/v4l/pixfmt.rst
index a7d4cd43a298..70ca3a5c2cf1 100644
--- a/Documentation/media/uapi/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/planar-apis.rst b/Documentation/userspace-api/media/v4l/planar-apis.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/planar-apis.rst
rename to Documentation/userspace-api/media/v4l/planar-apis.rst
index a422dc9d592c..6247b0c4ab4d 100644
--- a/Documentation/media/uapi/v4l/planar-apis.rst
+++ b/Documentation/userspace-api/media/v4l/planar-apis.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/querycap.rst b/Documentation/userspace-api/media/v4l/querycap.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/querycap.rst
rename to Documentation/userspace-api/media/v4l/querycap.rst
index 8d01ef52f780..35fba2a9e09b 100644
--- a/Documentation/media/uapi/v4l/querycap.rst
+++ b/Documentation/userspace-api/media/v4l/querycap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/rw.rst b/Documentation/userspace-api/media/v4l/rw.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/rw.rst
rename to Documentation/userspace-api/media/v4l/rw.rst
index 6e498fcf32c4..ce2768c994d0 100644
--- a/Documentation/media/uapi/v4l/rw.rst
+++ b/Documentation/userspace-api/media/v4l/rw.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/sdr-formats.rst b/Documentation/userspace-api/media/v4l/sdr-formats.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/sdr-formats.rst
rename to Documentation/userspace-api/media/v4l/sdr-formats.rst
index f452f5574ebb..b7a1be75251f 100644
--- a/Documentation/media/uapi/v4l/sdr-formats.rst
+++ b/Documentation/userspace-api/media/v4l/sdr-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/selection-api-configuration.rst
rename to Documentation/userspace-api/media/v4l/selection-api-configuration.rst
index 6e0c98c37067..67ff67fd734e 100644
--- a/Documentation/media/uapi/v4l/selection-api-configuration.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection-api-examples.rst b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/selection-api-examples.rst
rename to Documentation/userspace-api/media/v4l/selection-api-examples.rst
index bb288b06cc17..2f4027211129 100644
--- a/Documentation/media/uapi/v4l/selection-api-examples.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection-api-intro.rst b/Documentation/userspace-api/media/v4l/selection-api-intro.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/selection-api-intro.rst
rename to Documentation/userspace-api/media/v4l/selection-api-intro.rst
index 0faed02d0226..0994ca25be5e 100644
--- a/Documentation/media/uapi/v4l/selection-api-intro.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-intro.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection-api-targets.rst b/Documentation/userspace-api/media/v4l/selection-api-targets.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/selection-api-targets.rst
rename to Documentation/userspace-api/media/v4l/selection-api-targets.rst
index 83d633bcbd6f..56eab969c9d8 100644
--- a/Documentation/media/uapi/v4l/selection-api-targets.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-targets.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection-api-vs-crop-api.rst b/Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/selection-api-vs-crop-api.rst
rename to Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst
index 79b3abca341a..a9360a000022 100644
--- a/Documentation/media/uapi/v4l/selection-api-vs-crop-api.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection-api.rst b/Documentation/userspace-api/media/v4l/selection-api.rst
similarity index 92%
rename from Documentation/media/uapi/v4l/selection-api.rst
rename to Documentation/userspace-api/media/v4l/selection-api.rst
index 5386004e87cf..b86e387721df 100644
--- a/Documentation/media/uapi/v4l/selection-api.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/selection.svg b/Documentation/userspace-api/media/v4l/selection.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/selection.svg
rename to Documentation/userspace-api/media/v4l/selection.svg
index 59d2bec9b278..c0e00ab2ae6b 100644
--- a/Documentation/media/uapi/v4l/selection.svg
+++ b/Documentation/userspace-api/media/v4l/selection.svg
@@ -22,7 +22,7 @@
        Version 1.1 or any later version published by the Free Software
        Foundation, with no Invariant Sections, no Front-Cover Texts
        and no Back-Cover Texts. A copy of the license is included at
-       Documentation/media/uapi/fdl-appendix.rst.
+       Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/selections-common.rst b/Documentation/userspace-api/media/v4l/selections-common.rst
similarity index 94%
rename from Documentation/media/uapi/v4l/selections-common.rst
rename to Documentation/userspace-api/media/v4l/selections-common.rst
index 28b32db280f2..d5ea05869a61 100644
--- a/Documentation/media/uapi/v4l/selections-common.rst
+++ b/Documentation/userspace-api/media/v4l/selections-common.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/standard.rst b/Documentation/userspace-api/media/v4l/standard.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/standard.rst
rename to Documentation/userspace-api/media/v4l/standard.rst
index bf8959b72988..61c341508eb3 100644
--- a/Documentation/media/uapi/v4l/standard.rst
+++ b/Documentation/userspace-api/media/v4l/standard.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/streaming-par.rst b/Documentation/userspace-api/media/v4l/streaming-par.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/streaming-par.rst
rename to Documentation/userspace-api/media/v4l/streaming-par.rst
index 425bd0ff1477..6d1a1b93ac8b 100644
--- a/Documentation/media/uapi/v4l/streaming-par.rst
+++ b/Documentation/userspace-api/media/v4l/streaming-par.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/subdev-formats.rst
rename to Documentation/userspace-api/media/v4l/subdev-formats.rst
index 15e11f27b4c8..264f975dae8f 100644
--- a/Documentation/media/uapi/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/subdev-image-processing-crop.svg b/Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/subdev-image-processing-crop.svg
rename to Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg
index 59321e09929d..109bbcebd3b4 100644
--- a/Documentation/media/uapi/v4l/subdev-image-processing-crop.svg
+++ b/Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/subdev-image-processing-full.svg b/Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/subdev-image-processing-full.svg
rename to Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg
index e739c54fbbfb..cfdb7532d5b6 100644
--- a/Documentation/media/uapi/v4l/subdev-image-processing-full.svg
+++ b/Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/subdev-image-processing-scaling-multi-source.svg b/Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/subdev-image-processing-scaling-multi-source.svg
rename to Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg
index 401d1456958c..f7f1379d30a6 100644
--- a/Documentation/media/uapi/v4l/subdev-image-processing-scaling-multi-source.svg
+++ b/Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/tch-formats.rst b/Documentation/userspace-api/media/v4l/tch-formats.rst
similarity index 91%
rename from Documentation/media/uapi/v4l/tch-formats.rst
rename to Documentation/userspace-api/media/v4l/tch-formats.rst
index 429c1010149d..f83aec85fd76 100644
--- a/Documentation/media/uapi/v4l/tch-formats.rst
+++ b/Documentation/userspace-api/media/v4l/tch-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/tuner.rst b/Documentation/userspace-api/media/v4l/tuner.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/tuner.rst
rename to Documentation/userspace-api/media/v4l/tuner.rst
index 601dc535199c..02a396eb6613 100644
--- a/Documentation/media/uapi/v4l/tuner.rst
+++ b/Documentation/userspace-api/media/v4l/tuner.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/user-func.rst
rename to Documentation/userspace-api/media/v4l/user-func.rst
index ca0ef21d77fe..f235f88efe89 100644
--- a/Documentation/media/uapi/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/userp.rst b/Documentation/userspace-api/media/v4l/userp.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/userp.rst
rename to Documentation/userspace-api/media/v4l/userp.rst
index b19da8655452..2d0fa7353066 100644
--- a/Documentation/media/uapi/v4l/userp.rst
+++ b/Documentation/userspace-api/media/v4l/userp.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/v4l2-selection-flags.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/v4l2-selection-flags.rst
rename to Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
index cc8f2a2b7cba..5c6f351b2443 100644
--- a/Documentation/media/uapi/v4l/v4l2-selection-flags.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/v4l2-selection-targets.rst
rename to Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
index aae0c0013eb1..69f500093aa2 100644
--- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/v4l2.rst b/Documentation/userspace-api/media/v4l/v4l2.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/v4l2.rst
rename to Documentation/userspace-api/media/v4l/v4l2.rst
index 97015b9b40b8..ab7c97c39b97 100644
--- a/Documentation/media/uapi/v4l/v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/v4l2grab-example.rst b/Documentation/userspace-api/media/v4l/v4l2grab-example.rst
similarity index 93%
rename from Documentation/media/uapi/v4l/v4l2grab-example.rst
rename to Documentation/userspace-api/media/v4l/v4l2grab-example.rst
index 2a0cfd4429c1..270738876f72 100644
--- a/Documentation/media/uapi/v4l/v4l2grab-example.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2grab-example.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/v4l2grab.c.rst b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/v4l2grab.c.rst
rename to Documentation/userspace-api/media/v4l/v4l2grab.c.rst
index e76c5fb7bd19..a21ff357a830 100644
--- a/Documentation/media/uapi/v4l/v4l2grab.c.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vbi_525.svg b/Documentation/userspace-api/media/v4l/vbi_525.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/vbi_525.svg
rename to Documentation/userspace-api/media/v4l/vbi_525.svg
index 6cd5def22b1f..b7d09057617e 100644
--- a/Documentation/media/uapi/v4l/vbi_525.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_525.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/vbi_625.svg b/Documentation/userspace-api/media/v4l/vbi_625.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/vbi_625.svg
rename to Documentation/userspace-api/media/v4l/vbi_625.svg
index 7aaae5ec4878..e1f5e8552c37 100644
--- a/Documentation/media/uapi/v4l/vbi_625.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_625.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/vbi_hsync.svg b/Documentation/userspace-api/media/v4l/vbi_hsync.svg
similarity index 99%
rename from Documentation/media/uapi/v4l/vbi_hsync.svg
rename to Documentation/userspace-api/media/v4l/vbi_hsync.svg
index f8e979ada7e3..77606a7b00a4 100644
--- a/Documentation/media/uapi/v4l/vbi_hsync.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_hsync.svg
@@ -5,7 +5,7 @@
     Version 1.1 or any later version published by the Free Software
     Foundation, with no Invariant Sections, no Front-Cover Texts
     and no Back-Cover Texts. A copy of the license is included at
-    Documentation/media/uapi/fdl-appendix.rst.
+    Documentation/userspace-api/media/fdl-appendix.rst.
 
     TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 -->
diff --git a/Documentation/media/uapi/v4l/video.rst b/Documentation/userspace-api/media/v4l/video.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/video.rst
rename to Documentation/userspace-api/media/v4l/video.rst
index 69603b5efbb5..9b73dba0eb8d 100644
--- a/Documentation/media/uapi/v4l/video.rst
+++ b/Documentation/userspace-api/media/v4l/video.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/videodev.rst b/Documentation/userspace-api/media/v4l/videodev.rst
similarity index 91%
rename from Documentation/media/uapi/v4l/videodev.rst
rename to Documentation/userspace-api/media/v4l/videodev.rst
index fa3d3398930a..c8244b895802 100644
--- a/Documentation/media/uapi/v4l/videodev.rst
+++ b/Documentation/userspace-api/media/v4l/videodev.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-create-bufs.rst
rename to Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index bd08e4f77ae4..bd580232be10 100644
--- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-cropcap.rst b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-cropcap.rst
rename to Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
index 019d3d3a0e0d..035ed9d577ae 100644
--- a/Documentation/media/uapi/v4l/vidioc-cropcap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst
rename to Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
index d38031dbe4e4..16078a2d3e3d 100644
--- a/Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst
rename to Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
index 112597c6cad2..6311a63278a5 100644
--- a/Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
rename to Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
index 784c5980da8d..7986a248bff9 100644
--- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-dqevent.rst
rename to Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 2f37d255352a..a9a176d5256d 100644
--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst
rename to Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
index 1d0acbf14c4f..60730c32bfe4 100644
--- a/Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst
rename to Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
index c313ca8b8cb5..16269b3b1715 100644
--- a/Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-enum-dv-timings.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
index 0b286e19b46b..89d6b860193a 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 8ca6ab701e4a..7e3142e11d77 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
index 563a67cddeca..0e3db737371f 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
index cd97546a7122..1934d7da9743 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-freq-bands.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-enum-freq-bands.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
index 0e97c09afe0e..ee3ba67601fa 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-freq-bands.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enumaudio.rst b/Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/vidioc-enumaudio.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst
index ee0c336c8721..afe4821e5863 100644
--- a/Documentation/media/uapi/v4l/vidioc-enumaudio.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enumaudioout.rst b/Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/vidioc-enumaudioout.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst
index 3a8882214d62..31c2ae460e2d 100644
--- a/Documentation/media/uapi/v4l/vidioc-enumaudioout.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enuminput.rst b/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-enuminput.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
index a0e4c4413121..510670bff3de 100644
--- a/Documentation/media/uapi/v4l/vidioc-enuminput.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enumoutput.rst b/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-enumoutput.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
index 0fea81f60541..591a99cf8000 100644
--- a/Documentation/media/uapi/v4l/vidioc-enumoutput.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-enumstd.rst b/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-enumstd.rst
rename to Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
index 1603b1b3b6e8..8a0508536c13 100644
--- a/Documentation/media/uapi/v4l/vidioc-enumstd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-expbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-expbuf.rst
rename to Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
index 4bd8cd79754c..384a9be9eba0 100644
--- a/Documentation/media/uapi/v4l/vidioc-expbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-audio.rst b/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-audio.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
index 7af4fe478ba4..68531bcb62ab 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-audio.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-audioout.rst b/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-audioout.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
index c6ea0396a96a..e13b74bf5ce3 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-audioout.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-crop.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
index 1eff59dc5f35..10e086be55d5 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-ctrl.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
index 8493b52adbb2..9831b7514028 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-ctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
index e36dd2622857..84806a893cb7 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-edid.rst b/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-edid.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
index e55b349a0c7e..0620f4cbbcbd 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-edid.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-enc-index.rst b/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-enc-index.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
index e285a1f14cdf..8aad30a7c6c3 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-enc-index.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index cdb2a2a512d6..add17c9204cb 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-fbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-fbuf.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
index 2d197e6bba8f..0124444419ae 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-fbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-fmt.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
index 1e69bfc46e8d..88bb69ec07e2 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-frequency.rst b/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-frequency.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
index cc30bae3dd6e..26300e0258a3 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-frequency.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-input.rst b/Documentation/userspace-api/media/v4l/vidioc-g-input.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/vidioc-g-input.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-input.rst
index 76b7d487466e..294e346678c1 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-input.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-input.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-jpegcomp.rst b/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-jpegcomp.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
index 5480277ab327..3b9981dcb8e0 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-jpegcomp.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-modulator.rst b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-modulator.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
index 2c33a8bdcc47..c2072f6e8756 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-modulator.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-output.rst b/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/vidioc-g-output.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-output.rst
index 69542d78977b..cad477420fd7 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-output.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-parm.rst b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-parm.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
index 044a459e073f..42e9f6ee7a59 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-parm.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-priority.rst b/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-priority.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
index 244b4dbe9df3..c8add130c7a4 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-priority.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-selection.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
index 7d8ef7ac8e27..faab0454b1e4 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-sliced-vbi-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-sliced-vbi-cap.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
index 388b826d44b3..7a62c4f4e37f 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-sliced-vbi-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-std.rst b/Documentation/userspace-api/media/v4l/vidioc-g-std.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-g-std.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-std.rst
index e633e42e3910..b0bdb719d405 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-std.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-std.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-g-tuner.rst b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-g-tuner.rst
rename to Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
index 82d23b8bd195..40bff6f0a88d 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-log-status.rst b/Documentation/userspace-api/media/v4l/vidioc-log-status.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/vidioc-log-status.rst
rename to Documentation/userspace-api/media/v4l/vidioc-log-status.rst
index 16bb5509ad66..64c06fa72b9c 100644
--- a/Documentation/media/uapi/v4l/vidioc-log-status.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-log-status.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-overlay.rst b/Documentation/userspace-api/media/v4l/vidioc-overlay.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/vidioc-overlay.rst
rename to Documentation/userspace-api/media/v4l/vidioc-overlay.rst
index fc5a86e8c1f2..74310ff486ba 100644
--- a/Documentation/media/uapi/v4l/vidioc-overlay.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-overlay.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-prepare-buf.rst b/Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst
similarity index 96%
rename from Documentation/media/uapi/v4l/vidioc-prepare-buf.rst
rename to Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst
index 7c6b5f4e1011..b6c09d5b128f 100644
--- a/Documentation/media/uapi/v4l/vidioc-prepare-buf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-qbuf.rst
rename to Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
index 407302d80684..ec0a54fbeb43 100644
--- a/Documentation/media/uapi/v4l/vidioc-qbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-query-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-query-dv-timings.rst
rename to Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst
index e9b055395382..ab86408446f3 100644
--- a/Documentation/media/uapi/v4l/vidioc-query-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-querybuf.rst b/Documentation/userspace-api/media/v4l/vidioc-querybuf.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-querybuf.rst
rename to Documentation/userspace-api/media/v4l/vidioc-querybuf.rst
index 7da60b24e8b6..646f91140ccf 100644
--- a/Documentation/media/uapi/v4l/vidioc-querybuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querybuf.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-querycap.rst
rename to Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 5f9930195d62..4ce8f87bd54a 100644
--- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-queryctrl.rst
rename to Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 8971f4cfb16e..fbb0038d86bf 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-querystd.rst b/Documentation/userspace-api/media/v4l/vidioc-querystd.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/vidioc-querystd.rst
rename to Documentation/userspace-api/media/v4l/vidioc-querystd.rst
index d8cf28274cfc..899f0ef6eefe 100644
--- a/Documentation/media/uapi/v4l/vidioc-querystd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querystd.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
similarity index 99%
rename from Documentation/media/uapi/v4l/vidioc-reqbufs.rst
rename to Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index d0c643db477a..79884bb4893b 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-s-hw-freq-seek.rst b/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-s-hw-freq-seek.rst
rename to Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
index 4daec97651f2..4c16e7e89cfa 100644
--- a/Documentation/media/uapi/v4l/vidioc-s-hw-freq-seek.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-streamon.rst b/Documentation/userspace-api/media/v4l/vidioc-streamon.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-streamon.rst
rename to Documentation/userspace-api/media/v4l/vidioc-streamon.rst
index 2b5528ec9f89..13e0136d5c25 100644
--- a/Documentation/media/uapi/v4l/vidioc-streamon.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-streamon.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-enum-frame-interval.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
index 6b4bf9ef5606..3527745935c7 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-enum-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-enum-frame-size.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
index 253b128b194e..eb7401991d02 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-enum-frame-size.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-enum-mbus-code.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index fefe4d7349ee..35b8607203a4 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 632ee053accc..8d9fc13015a6 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
index 472577bd1745..69d60e18664b 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
index 4b1b4bc78bfe..b61baaf11624 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-g-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
index fc73d27e6d74..981c95df2dec 100644
--- a/Documentation/media/uapi/v4l/vidioc-subdev-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
similarity index 98%
rename from Documentation/media/uapi/v4l/vidioc-subscribe-event.rst
rename to Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
index a2d3454555ba..ae3ed73c0a9e 100644
--- a/Documentation/media/uapi/v4l/vidioc-subscribe-event.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/uapi/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
similarity index 97%
rename from Documentation/media/uapi/v4l/yuv-formats.rst
rename to Documentation/userspace-api/media/v4l/yuv-formats.rst
index 867470e5f9e1..77ac74bdb260 100644
--- a/Documentation/media/uapi/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -3,7 +3,7 @@
 .. Version 1.1 or any later version published by the Free Software
 .. Foundation, with no Invariant Sections, no Front-Cover Texts
 .. and no Back-Cover Texts. A copy of the license is included at
-.. Documentation/media/uapi/fdl-appendix.rst.
+.. Documentation/userspace-api/media/fdl-appendix.rst.
 ..
 .. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
 
diff --git a/Documentation/media/video.h.rst.exceptions b/Documentation/userspace-api/media/video.h.rst.exceptions
similarity index 100%
rename from Documentation/media/video.h.rst.exceptions
rename to Documentation/userspace-api/media/video.h.rst.exceptions
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
similarity index 100%
rename from Documentation/media/videodev2.h.rst.exceptions
rename to Documentation/userspace-api/media/videodev2.h.rst.exceptions
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c5e2e4d3854..0ce0a1c93961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3854,7 +3854,7 @@ T:	git git://linuxtv.org/media_tree.git
 W:	http://linuxtv.org
 S:	Supported
 F:	Documentation/media/kapi/cec-core.rst
-F:	Documentation/media/uapi/cec
+F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
 F:	drivers/media/rc/keymaps/rc-cec.c
 F:	include/media/cec.h
@@ -5108,6 +5108,7 @@ X:	Documentation/firmware-guide/acpi/
 X:	Documentation/devicetree/
 X:	Documentation/i2c/
 X:	Documentation/media/
+X:	Documentation/userspace-api/media/
 X:	Documentation/power/
 X:	Documentation/spi/
 T:	git git://git.lwn.net/linux.git docs-next
@@ -8519,14 +8520,14 @@ R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/pci/intel/ipu3/
-F:	Documentation/media/uapi/v4l/pixfmt-srggb10-ipu3.rst
+F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/ipu3/
-F:	Documentation/media/uapi/v4l/pixfmt-meta-intel-ipu3.rst
+F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
 F:	Documentation/media/v4l-drivers/ipu3.rst
 F:	Documentation/media/v4l-drivers/ipu3_rcb.svg
 
@@ -10487,6 +10488,7 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/
 F:	Documentation/media/
+F:	Documentation/userspace-api/media/
 F:	drivers/media/
 F:	drivers/staging/media/
 F:	include/linux/platform_data/media/
diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
index eb79d99787bd..f4df16df19d9 100644
--- a/drivers/media/radio/Kconfig
+++ b/drivers/media/radio/Kconfig
@@ -36,7 +36,7 @@ config RADIO_SI476X
 	  In order to control your radio card, you will need to use programs
 	  that are compatible with the Video For Linux 2 API.  Information on
 	  this API and pointers to "v4l2" programs may be found at
-	  <file:Documentation/media/media_uapi.rst>.
+	  <file:Documentation/userspace-api/media/index.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called radio-si476x.
@@ -76,7 +76,7 @@ config RADIO_MAXIRADIO
 	  In order to control your radio card, you will need to use programs
 	  that are compatible with the Video For Linux API.  Information on
 	  this API and pointers to "v4l" programs may be found at
-	  <file:Documentation/media/media_uapi.rst>.
+	  <file:Documentation/userspace-api/media/index.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called radio-maxiradio.
@@ -94,7 +94,7 @@ config RADIO_SHARK
 	  In order to control your radio card, you will need to use programs
 	  that are compatible with the Video For Linux API.  Information on
 	  this API and pointers to "v4l" programs may be found at
-	  <file:Documentation/media/media_uapi.rst>.
+	  <file:Documentation/userspace-api/media/index.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called radio-shark.
@@ -111,7 +111,7 @@ config RADIO_SHARK2
 	  In order to control your radio card, you will need to use programs
 	  that are compatible with the Video For Linux API.  Information on
 	  this API and pointers to "v4l" programs may be found at
-	  <file:Documentation/media/media_uapi.rst>.
+	  <file:Documentation/userspace-api/media/index.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called radio-shark2.
@@ -218,7 +218,7 @@ config RADIO_WL1273
 	  In order to control your radio card, you will need to use programs
 	  that are compatible with the Video For Linux 2 API.  Information on
 	  this API and pointers to "v4l2" programs may be found at
-	  <file:Documentation/media/media_uapi.rst>.
+	  <file:Documentation/userspace-api/media/index.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called radio-wl1273.
diff --git a/drivers/media/radio/wl128x/Kconfig b/drivers/media/radio/wl128x/Kconfig
index 1dee7277004b..7b45222730aa 100644
--- a/drivers/media/radio/wl128x/Kconfig
+++ b/drivers/media/radio/wl128x/Kconfig
@@ -13,6 +13,6 @@ config RADIO_WL128X
 	  In order to control your radio card, you will need to use programs
 	  that are compatible with the Video For Linux 2 API.  Information on
 	  this API and pointers to "v4l2" programs may be found at
-	  <file:Documentation/media/media_uapi.rst>.
+	  <file:Documentation/userspace-api/media/index.rst>.
 
 endmenu
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
