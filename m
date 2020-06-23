Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CF204E7A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 11:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6A289CE0;
	Tue, 23 Jun 2020 09:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618089CD7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:53:07 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35EC620776;
 Tue, 23 Jun 2020 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592905986;
 bh=OUZvULT7cNmUiydBEetp+SRwmmohsnNgRSIIEac+QA0=;
 h=From:To:Cc:Subject:Date:From;
 b=nXizfnjLSuuRffk5Zr2JFzrimy8VNT80eDTe56x6MYEf4shP4+DT+5aw7JMvu3ABc
 LsqbNEj9LLN2YmnKW3ykqopB0RJeDOIyx+FnwXcg+/w8KupQcNmt0OVtq7AvEEIui+
 ZRCHzmnu7SIkTXFIxWoThDgYrZlBLxddVVnCZv8c=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jnfbz-004C32-QD; Tue, 23 Jun 2020 11:53:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/9] Convert the remaining text files to ReST and add SPDX
 for GFDL
Date: Tue, 23 Jun 2020 11:52:53 +0200
Message-Id: <cover.1592905407.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Harry Wei <harryxiyou@gmail.com>,
 Alex Shi <alex.shi@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-spdx@vger.kernel.org,
 Tian Shu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andrew Morton <akpm@linux-foundation.org>, Yong Zhi <yong.zhi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal of this series is to finish the ReST conversion. After this
series, we have just those files still in plain old format:

	- Documentation/RCU/RTFP.txt
	- Documentation/atomic_bitops.txt
	- Documentation/memory-barriers.txt
	- Documentation/atomic_t.txt
	- Documentation/filesystems/dax.txt
	- Documentation/filesystems/path-lookup.txt
	- Documentation/virt/kvm/devices/README

PS.: I'm using a script to remove false-positives and ignore non-converted
translated files.

It is worth to mention that this fseries contain licenses for the two
GFDL licenses used within the Kernel: GFDL-1.1+ and GFDL-1.2.

Those licenses are the result of long discussions with the SPDX legal
team, and are part of this commit, to be added for the future
SPDX 3.10 version:
	https://github.com/spdx/license-list-XML/pull/1048/commits/f695d2ac65230d0f4161ba58fff2f9d87bb5a053

Mauro Carvalho Chehab (9):
  docs: dt: convert booting-without-of.txt to ReST format
  LICENSES: add GFDL licenses
  media: docs: use SPDX GFDL-1.1-or-later-no-invariants
  docs: trace: ring-buffer-design.txt: convert to ReST format
  docs: move nommu-mmap.txt to admin-guide and rename to ReST
  docs: move mailbox.txt to driver-api and rename it
  docs: move other kAPI documents to core-api
  docs: Add remaining Documentation/*.txt at staging/index.rst
  docs: staging: use small font for literal includes

 Documentation/admin-guide/mm/index.rst        |   1 +
 .../mm/nommu-mmap.rst}                        |   0
 Documentation/admin-guide/sysctl/vm.rst       |   2 +-
 Documentation/arm/booting.rst                 |   2 +-
 .../bus-virt-phys-mapping.rst}                |   0
 Documentation/core-api/index.rst              |   3 +
 .../this_cpu_ops.rst}                         |   0
 .../unaligned-memory-access.rst               |   0
 ...-without-of.txt => booting-without-of.rst} | 298 ++++---
 Documentation/devicetree/index.rst            |   1 +
 Documentation/driver-api/index.rst            |   1 +
 .../{mailbox.txt => driver-api/mailbox.rst}   |   0
 Documentation/gpu/drm-mm.rst                  |   2 +-
 Documentation/staging/index.rst               |  24 +
 Documentation/trace/index.rst                 |   1 +
 ...ffer-design.txt => ring-buffer-design.rst} | 778 +++++++++---------
 Documentation/translations/zh_CN/arm/Booting  |   2 +-
 .../userspace-api/media/cec/cec-api.rst       |   9 +-
 .../media/cec/cec-func-close.rst              |   9 +-
 .../media/cec/cec-func-ioctl.rst              |   9 +-
 .../userspace-api/media/cec/cec-func-open.rst |   9 +-
 .../userspace-api/media/cec/cec-func-poll.rst |   9 +-
 .../userspace-api/media/cec/cec-funcs.rst     |   9 +-
 .../userspace-api/media/cec/cec-header.rst    |   9 +-
 .../userspace-api/media/cec/cec-intro.rst     |   9 +-
 .../media/cec/cec-ioc-adap-g-caps.rst         |   9 +-
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    |   9 +-
 .../media/cec/cec-ioc-adap-g-phys-addr.rst    |   9 +-
 .../media/cec/cec-ioc-dqevent.rst             |   9 +-
 .../media/cec/cec-ioc-g-mode.rst              |   9 +-
 .../media/cec/cec-ioc-receive.rst             |   9 +-
 .../media/cec/cec-pin-error-inj.rst           |   9 +-
 .../dvb/audio-bilingual-channel-select.rst    |   9 +-
 .../media/dvb/audio-channel-select.rst        |   9 +-
 .../media/dvb/audio-clear-buffer.rst          |   9 +-
 .../media/dvb/audio-continue.rst              |   9 +-
 .../userspace-api/media/dvb/audio-fclose.rst  |   9 +-
 .../userspace-api/media/dvb/audio-fopen.rst   |   9 +-
 .../userspace-api/media/dvb/audio-fwrite.rst  |   9 +-
 .../media/dvb/audio-get-capabilities.rst      |   9 +-
 .../media/dvb/audio-get-status.rst            |   9 +-
 .../userspace-api/media/dvb/audio-pause.rst   |   9 +-
 .../userspace-api/media/dvb/audio-play.rst    |   9 +-
 .../media/dvb/audio-select-source.rst         |   9 +-
 .../media/dvb/audio-set-av-sync.rst           |   9 +-
 .../media/dvb/audio-set-bypass-mode.rst       |   9 +-
 .../userspace-api/media/dvb/audio-set-id.rst  |   9 +-
 .../media/dvb/audio-set-mixer.rst             |   9 +-
 .../media/dvb/audio-set-mute.rst              |   9 +-
 .../media/dvb/audio-set-streamtype.rst        |   9 +-
 .../userspace-api/media/dvb/audio-stop.rst    |   9 +-
 .../userspace-api/media/dvb/audio.rst         |   9 +-
 .../media/dvb/audio_data_types.rst            |   9 +-
 .../media/dvb/audio_function_calls.rst        |   9 +-
 .../userspace-api/media/dvb/ca-fclose.rst     |   9 +-
 .../userspace-api/media/dvb/ca-fopen.rst      |   9 +-
 .../userspace-api/media/dvb/ca-get-cap.rst    |   9 +-
 .../media/dvb/ca-get-descr-info.rst           |   9 +-
 .../userspace-api/media/dvb/ca-get-msg.rst    |   9 +-
 .../media/dvb/ca-get-slot-info.rst            |   9 +-
 .../userspace-api/media/dvb/ca-reset.rst      |   9 +-
 .../userspace-api/media/dvb/ca-send-msg.rst   |   9 +-
 .../userspace-api/media/dvb/ca-set-descr.rst  |   9 +-
 Documentation/userspace-api/media/dvb/ca.rst  |   9 +-
 .../userspace-api/media/dvb/ca_data_types.rst |   9 +-
 .../media/dvb/ca_function_calls.rst           |   9 +-
 .../userspace-api/media/dvb/demux.rst         |   9 +-
 .../userspace-api/media/dvb/dmx-add-pid.rst   |   9 +-
 .../userspace-api/media/dvb/dmx-expbuf.rst    |   9 +-
 .../userspace-api/media/dvb/dmx-fclose.rst    |   9 +-
 .../userspace-api/media/dvb/dmx-fopen.rst     |   9 +-
 .../userspace-api/media/dvb/dmx-fread.rst     |   9 +-
 .../userspace-api/media/dvb/dmx-fwrite.rst    |   9 +-
 .../media/dvb/dmx-get-pes-pids.rst            |   9 +-
 .../userspace-api/media/dvb/dmx-get-stc.rst   |   9 +-
 .../userspace-api/media/dvb/dmx-mmap.rst      |   9 +-
 .../userspace-api/media/dvb/dmx-munmap.rst    |   9 +-
 .../userspace-api/media/dvb/dmx-qbuf.rst      |   9 +-
 .../userspace-api/media/dvb/dmx-querybuf.rst  |   9 +-
 .../media/dvb/dmx-remove-pid.rst              |   9 +-
 .../userspace-api/media/dvb/dmx-reqbufs.rst   |   9 +-
 .../media/dvb/dmx-set-buffer-size.rst         |   9 +-
 .../media/dvb/dmx-set-filter.rst              |   9 +-
 .../media/dvb/dmx-set-pes-filter.rst          |   9 +-
 .../userspace-api/media/dvb/dmx-start.rst     |   9 +-
 .../userspace-api/media/dvb/dmx-stop.rst      |   9 +-
 .../userspace-api/media/dvb/dmx_fcalls.rst    |   9 +-
 .../userspace-api/media/dvb/dmx_types.rst     |   9 +-
 .../media/dvb/dvb-fe-read-status.rst          |   9 +-
 .../media/dvb/dvb-frontend-event.rst          |   9 +-
 .../media/dvb/dvb-frontend-parameters.rst     |   9 +-
 .../userspace-api/media/dvb/dvbapi.rst        |   9 +-
 .../userspace-api/media/dvb/dvbproperty.rst   |   9 +-
 .../userspace-api/media/dvb/examples.rst      |   9 +-
 .../media/dvb/fe-bandwidth-t.rst              |   9 +-
 .../media/dvb/fe-diseqc-recv-slave-reply.rst  |   9 +-
 .../media/dvb/fe-diseqc-reset-overload.rst    |   9 +-
 .../media/dvb/fe-diseqc-send-burst.rst        |   9 +-
 .../media/dvb/fe-diseqc-send-master-cmd.rst   |   9 +-
 .../dvb/fe-dishnetwork-send-legacy-cmd.rst    |   9 +-
 .../media/dvb/fe-enable-high-lnb-voltage.rst  |   9 +-
 .../userspace-api/media/dvb/fe-get-event.rst  |   9 +-
 .../media/dvb/fe-get-frontend.rst             |   9 +-
 .../userspace-api/media/dvb/fe-get-info.rst   |   9 +-
 .../media/dvb/fe-get-property.rst             |   9 +-
 .../userspace-api/media/dvb/fe-read-ber.rst   |   9 +-
 .../media/dvb/fe-read-signal-strength.rst     |   9 +-
 .../userspace-api/media/dvb/fe-read-snr.rst   |   9 +-
 .../media/dvb/fe-read-status.rst              |   9 +-
 .../media/dvb/fe-read-uncorrected-blocks.rst  |   9 +-
 .../media/dvb/fe-set-frontend-tune-mode.rst   |   9 +-
 .../media/dvb/fe-set-frontend.rst             |   9 +-
 .../userspace-api/media/dvb/fe-set-tone.rst   |   9 +-
 .../media/dvb/fe-set-voltage.rst              |   9 +-
 .../userspace-api/media/dvb/fe-type-t.rst     |   9 +-
 .../media/dvb/fe_property_parameters.rst      |   9 +-
 .../media/dvb/frontend-header.rst             |   9 +-
 .../dvb/frontend-property-cable-systems.rst   |   9 +-
 .../frontend-property-satellite-systems.rst   |   9 +-
 .../frontend-property-terrestrial-systems.rst |   9 +-
 .../media/dvb/frontend-stat-properties.rst    |   9 +-
 .../userspace-api/media/dvb/frontend.rst      |   9 +-
 .../media/dvb/frontend_f_close.rst            |   9 +-
 .../media/dvb/frontend_f_open.rst             |   9 +-
 .../media/dvb/frontend_fcalls.rst             |   9 +-
 .../media/dvb/frontend_legacy_api.rst         |   9 +-
 .../media/dvb/frontend_legacy_dvbv3_api.rst   |   9 +-
 .../userspace-api/media/dvb/headers.rst       |   9 +-
 .../userspace-api/media/dvb/intro.rst         |   9 +-
 .../media/dvb/legacy_dvb_apis.rst             |   9 +-
 .../userspace-api/media/dvb/net-add-if.rst    |   9 +-
 .../userspace-api/media/dvb/net-get-if.rst    |   9 +-
 .../userspace-api/media/dvb/net-remove-if.rst |   9 +-
 .../userspace-api/media/dvb/net-types.rst     |   9 +-
 Documentation/userspace-api/media/dvb/net.rst |   9 +-
 .../media/dvb/query-dvb-frontend-info.rst     |   9 +-
 .../media/dvb/video-clear-buffer.rst          |   9 +-
 .../userspace-api/media/dvb/video-command.rst |   9 +-
 .../media/dvb/video-continue.rst              |   9 +-
 .../media/dvb/video-fast-forward.rst          |   9 +-
 .../userspace-api/media/dvb/video-fclose.rst  |   9 +-
 .../userspace-api/media/dvb/video-fopen.rst   |   9 +-
 .../userspace-api/media/dvb/video-freeze.rst  |   9 +-
 .../userspace-api/media/dvb/video-fwrite.rst  |   9 +-
 .../media/dvb/video-get-capabilities.rst      |   9 +-
 .../media/dvb/video-get-event.rst             |   9 +-
 .../media/dvb/video-get-frame-count.rst       |   9 +-
 .../userspace-api/media/dvb/video-get-pts.rst |   9 +-
 .../media/dvb/video-get-size.rst              |   9 +-
 .../media/dvb/video-get-status.rst            |   9 +-
 .../userspace-api/media/dvb/video-play.rst    |   9 +-
 .../media/dvb/video-select-source.rst         |   9 +-
 .../media/dvb/video-set-blank.rst             |   9 +-
 .../media/dvb/video-set-display-format.rst    |   9 +-
 .../media/dvb/video-set-format.rst            |   9 +-
 .../media/dvb/video-set-streamtype.rst        |   9 +-
 .../media/dvb/video-slowmotion.rst            |   9 +-
 .../media/dvb/video-stillpicture.rst          |   9 +-
 .../userspace-api/media/dvb/video-stop.rst    |   9 +-
 .../media/dvb/video-try-command.rst           |   9 +-
 .../userspace-api/media/dvb/video.rst         |   9 +-
 .../media/dvb/video_function_calls.rst        |   9 +-
 .../userspace-api/media/dvb/video_types.rst   |   9 +-
 .../userspace-api/media/fdl-appendix.rst      |   9 +-
 .../userspace-api/media/gen-errors.rst        |   9 +-
 .../media/mediactl/media-controller-intro.rst |   9 +-
 .../media/mediactl/media-controller-model.rst |   9 +-
 .../media/mediactl/media-controller.rst       |   9 +-
 .../media/mediactl/media-func-close.rst       |   9 +-
 .../media/mediactl/media-func-ioctl.rst       |   9 +-
 .../media/mediactl/media-func-open.rst        |   9 +-
 .../media/mediactl/media-funcs.rst            |   9 +-
 .../media/mediactl/media-header.rst           |   9 +-
 .../media/mediactl/media-ioc-device-info.rst  |   9 +-
 .../mediactl/media-ioc-enum-entities.rst      |   9 +-
 .../media/mediactl/media-ioc-enum-links.rst   |   9 +-
 .../media/mediactl/media-ioc-g-topology.rst   |   9 +-
 .../mediactl/media-ioc-request-alloc.rst      |  26 +-
 .../media/mediactl/media-ioc-setup-link.rst   |   9 +-
 .../mediactl/media-request-ioc-queue.rst      |  26 +-
 .../mediactl/media-request-ioc-reinit.rst     |  26 +-
 .../media/mediactl/media-types.rst            |   9 +-
 .../media/mediactl/request-api.rst            |  26 +-
 .../media/mediactl/request-func-close.rst     |  26 +-
 .../media/mediactl/request-func-ioctl.rst     |  26 +-
 .../media/mediactl/request-func-poll.rst      |  26 +-
 .../userspace-api/media/rc/keytable.c.rst     |   9 +-
 .../userspace-api/media/rc/lirc-dev-intro.rst |   9 +-
 .../userspace-api/media/rc/lirc-dev.rst       |   9 +-
 .../userspace-api/media/rc/lirc-func.rst      |   9 +-
 .../media/rc/lirc-get-features.rst            |   9 +-
 .../media/rc/lirc-get-rec-mode.rst            |   9 +-
 .../media/rc/lirc-get-rec-resolution.rst      |   9 +-
 .../media/rc/lirc-get-send-mode.rst           |   9 +-
 .../media/rc/lirc-get-timeout.rst             |   9 +-
 .../userspace-api/media/rc/lirc-header.rst    |   9 +-
 .../userspace-api/media/rc/lirc-read.rst      |   9 +-
 .../rc/lirc-set-measure-carrier-mode.rst      |   9 +-
 .../media/rc/lirc-set-rec-carrier-range.rst   |   9 +-
 .../media/rc/lirc-set-rec-carrier.rst         |   9 +-
 .../media/rc/lirc-set-rec-timeout-reports.rst |   9 +-
 .../media/rc/lirc-set-rec-timeout.rst         |   9 +-
 .../media/rc/lirc-set-send-carrier.rst        |   9 +-
 .../media/rc/lirc-set-send-duty-cycle.rst     |   9 +-
 .../media/rc/lirc-set-transmitter-mask.rst    |   9 +-
 .../media/rc/lirc-set-wideband-receiver.rst   |   9 +-
 .../userspace-api/media/rc/lirc-write.rst     |   9 +-
 .../userspace-api/media/rc/rc-intro.rst       |   9 +-
 .../userspace-api/media/rc/rc-protos.rst      |   4 +-
 .../userspace-api/media/rc/rc-sysfs-nodes.rst |   9 +-
 .../media/rc/rc-table-change.rst              |   9 +-
 .../userspace-api/media/rc/rc-tables.rst      |   9 +-
 .../media/rc/remote_controllers.rst           |   9 +-
 .../userspace-api/media/v4l/app-pri.rst       |   9 +-
 .../userspace-api/media/v4l/async.rst         |   9 +-
 .../userspace-api/media/v4l/audio.rst         |   9 +-
 .../userspace-api/media/v4l/biblio.rst        |   9 +-
 .../userspace-api/media/v4l/buffer.rst        |   9 +-
 .../media/v4l/capture-example.rst             |   9 +-
 .../userspace-api/media/v4l/capture.c.rst     |   9 +-
 .../media/v4l/colorspaces-defs.rst            |   9 +-
 .../media/v4l/colorspaces-details.rst         |   9 +-
 .../userspace-api/media/v4l/colorspaces.rst   |   9 +-
 .../userspace-api/media/v4l/common-defs.rst   |   9 +-
 .../userspace-api/media/v4l/common.rst        |   9 +-
 .../userspace-api/media/v4l/compat.rst        |   9 +-
 .../userspace-api/media/v4l/control.rst       |   9 +-
 .../userspace-api/media/v4l/crop.rst          |   9 +-
 .../userspace-api/media/v4l/depth-formats.rst |   9 +-
 .../userspace-api/media/v4l/dev-capture.rst   |   9 +-
 .../userspace-api/media/v4l/dev-event.rst     |   9 +-
 .../userspace-api/media/v4l/dev-mem2mem.rst   |   9 +-
 .../userspace-api/media/v4l/dev-meta.rst      |   9 +-
 .../userspace-api/media/v4l/dev-osd.rst       |   9 +-
 .../userspace-api/media/v4l/dev-output.rst    |   9 +-
 .../userspace-api/media/v4l/dev-overlay.rst   |   9 +-
 .../userspace-api/media/v4l/dev-radio.rst     |   9 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst   |   9 +-
 .../userspace-api/media/v4l/dev-rds.rst       |   9 +-
 .../userspace-api/media/v4l/dev-sdr.rst       |   9 +-
 .../media/v4l/dev-sliced-vbi.rst              |   9 +-
 .../userspace-api/media/v4l/dev-subdev.rst    |   9 +-
 .../userspace-api/media/v4l/dev-touch.rst     |   9 +-
 .../userspace-api/media/v4l/devices.rst       |   9 +-
 .../userspace-api/media/v4l/diff-v4l.rst      |   9 +-
 .../userspace-api/media/v4l/dmabuf.rst        |   9 +-
 .../userspace-api/media/v4l/dv-timings.rst    |   9 +-
 .../media/v4l/ext-ctrls-camera.rst            |   9 +-
 .../media/v4l/ext-ctrls-codec.rst             |   9 +-
 .../media/v4l/ext-ctrls-detect.rst            |   9 +-
 .../userspace-api/media/v4l/ext-ctrls-dv.rst  |   9 +-
 .../media/v4l/ext-ctrls-flash.rst             |   9 +-
 .../media/v4l/ext-ctrls-fm-rx.rst             |   9 +-
 .../media/v4l/ext-ctrls-fm-tx.rst             |   9 +-
 .../media/v4l/ext-ctrls-image-process.rst     |   9 +-
 .../media/v4l/ext-ctrls-image-source.rst      |   9 +-
 .../media/v4l/ext-ctrls-jpeg.rst              |   9 +-
 .../media/v4l/ext-ctrls-rf-tuner.rst          |   9 +-
 .../media/v4l/extended-controls.rst           |   9 +-
 .../userspace-api/media/v4l/field-order.rst   |   9 +-
 .../userspace-api/media/v4l/format.rst        |   9 +-
 .../userspace-api/media/v4l/func-close.rst    |   9 +-
 .../userspace-api/media/v4l/func-ioctl.rst    |   9 +-
 .../userspace-api/media/v4l/func-mmap.rst     |   9 +-
 .../userspace-api/media/v4l/func-munmap.rst   |   9 +-
 .../userspace-api/media/v4l/func-open.rst     |   9 +-
 .../userspace-api/media/v4l/func-poll.rst     |   9 +-
 .../userspace-api/media/v4l/func-read.rst     |   9 +-
 .../userspace-api/media/v4l/func-select.rst   |   9 +-
 .../userspace-api/media/v4l/func-write.rst    |   9 +-
 .../userspace-api/media/v4l/hist-v4l2.rst     |   9 +-
 .../userspace-api/media/v4l/hsv-formats.rst   |   9 +-
 Documentation/userspace-api/media/v4l/io.rst  |   9 +-
 .../media/v4l/libv4l-introduction.rst         |   9 +-
 .../userspace-api/media/v4l/libv4l.rst        |   9 +-
 .../userspace-api/media/v4l/meta-formats.rst  |   9 +-
 .../userspace-api/media/v4l/mmap.rst          |   9 +-
 .../userspace-api/media/v4l/open.rst          |   9 +-
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   9 +-
 .../media/v4l/pixfmt-compressed.rst           |   9 +-
 .../userspace-api/media/v4l/pixfmt-grey.rst   |   9 +-
 .../media/v4l/pixfmt-indexed.rst              |   9 +-
 .../userspace-api/media/v4l/pixfmt-intro.rst  |   9 +-
 .../userspace-api/media/v4l/pixfmt-inzi.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-m420.rst   |   9 +-
 .../media/v4l/pixfmt-meta-d4xx.rst            |   9 +-
 .../media/v4l/pixfmt-meta-intel-ipu3.rst      |  25 +-
 .../media/v4l/pixfmt-meta-uvc.rst             |   9 +-
 .../media/v4l/pixfmt-meta-vivid.rst           |  26 +-
 .../media/v4l/pixfmt-meta-vsp1-hgo.rst        |   9 +-
 .../media/v4l/pixfmt-meta-vsp1-hgt.rst        |   9 +-
 .../userspace-api/media/v4l/pixfmt-nv12.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-nv12m.rst  |   9 +-
 .../userspace-api/media/v4l/pixfmt-nv12mt.rst |   9 +-
 .../userspace-api/media/v4l/pixfmt-nv16.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-nv16m.rst  |   9 +-
 .../userspace-api/media/v4l/pixfmt-nv24.rst   |   9 +-
 .../media/v4l/pixfmt-packed-hsv.rst           |   9 +-
 .../media/v4l/pixfmt-packed-yuv.rst           |   9 +-
 .../media/v4l/pixfmt-reserved.rst             |   9 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |   9 +-
 .../media/v4l/pixfmt-sdr-cs08.rst             |   9 +-
 .../media/v4l/pixfmt-sdr-cs14le.rst           |   9 +-
 .../media/v4l/pixfmt-sdr-cu08.rst             |   9 +-
 .../media/v4l/pixfmt-sdr-cu16le.rst           |   9 +-
 .../media/v4l/pixfmt-sdr-pcu16be.rst          |   9 +-
 .../media/v4l/pixfmt-sdr-pcu18be.rst          |   9 +-
 .../media/v4l/pixfmt-sdr-pcu20be.rst          |   9 +-
 .../media/v4l/pixfmt-sdr-ru12le.rst           |   9 +-
 .../media/v4l/pixfmt-srggb10-ipu3.rst         |   9 +-
 .../media/v4l/pixfmt-srggb10.rst              |   9 +-
 .../media/v4l/pixfmt-srggb10alaw8.rst         |   9 +-
 .../media/v4l/pixfmt-srggb10dpcm8.rst         |   9 +-
 .../media/v4l/pixfmt-srggb10p.rst             |   9 +-
 .../media/v4l/pixfmt-srggb12.rst              |   9 +-
 .../media/v4l/pixfmt-srggb12p.rst             |   9 +-
 .../media/v4l/pixfmt-srggb14.rst              |   9 +-
 .../media/v4l/pixfmt-srggb14p.rst             |   9 +-
 .../media/v4l/pixfmt-srggb16.rst              |   9 +-
 .../userspace-api/media/v4l/pixfmt-srggb8.rst |   9 +-
 .../media/v4l/pixfmt-tch-td08.rst             |   9 +-
 .../media/v4l/pixfmt-tch-td16.rst             |   9 +-
 .../media/v4l/pixfmt-tch-tu08.rst             |   9 +-
 .../media/v4l/pixfmt-tch-tu16.rst             |   9 +-
 .../userspace-api/media/v4l/pixfmt-uv8.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt-uyvy.rst   |   9 +-
 .../media/v4l/pixfmt-v4l2-mplane.rst          |   9 +-
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-vyuy.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-y10.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt-y10b.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-y10p.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-y12.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt-y12i.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-y14.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt-y16-be.rst |   9 +-
 .../userspace-api/media/v4l/pixfmt-y16.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt-y41p.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-y8i.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt-yuv410.rst |   9 +-
 .../media/v4l/pixfmt-yuv411p.rst              |   9 +-
 .../userspace-api/media/v4l/pixfmt-yuv420.rst |   9 +-
 .../media/v4l/pixfmt-yuv420m.rst              |   9 +-
 .../media/v4l/pixfmt-yuv422m.rst              |   9 +-
 .../media/v4l/pixfmt-yuv422p.rst              |   9 +-
 .../media/v4l/pixfmt-yuv444m.rst              |   9 +-
 .../userspace-api/media/v4l/pixfmt-yuyv.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-yvyu.rst   |   9 +-
 .../userspace-api/media/v4l/pixfmt-z16.rst    |   9 +-
 .../userspace-api/media/v4l/pixfmt.rst        |   9 +-
 .../userspace-api/media/v4l/planar-apis.rst   |   9 +-
 .../userspace-api/media/v4l/querycap.rst      |   9 +-
 Documentation/userspace-api/media/v4l/rw.rst  |   9 +-
 .../userspace-api/media/v4l/sdr-formats.rst   |   9 +-
 .../media/v4l/selection-api-configuration.rst |   9 +-
 .../media/v4l/selection-api-examples.rst      |   9 +-
 .../media/v4l/selection-api-intro.rst         |   9 +-
 .../media/v4l/selection-api-targets.rst       |   9 +-
 .../media/v4l/selection-api-vs-crop-api.rst   |   9 +-
 .../userspace-api/media/v4l/selection-api.rst |   9 +-
 .../media/v4l/selections-common.rst           |   9 +-
 .../userspace-api/media/v4l/standard.rst      |   9 +-
 .../userspace-api/media/v4l/streaming-par.rst |   9 +-
 .../media/v4l/subdev-formats.rst              |   9 +-
 .../userspace-api/media/v4l/tch-formats.rst   |   9 +-
 .../userspace-api/media/v4l/tuner.rst         |   9 +-
 .../userspace-api/media/v4l/user-func.rst     |   9 +-
 .../userspace-api/media/v4l/userp.rst         |   9 +-
 .../media/v4l/v4l2-selection-flags.rst        |   9 +-
 .../media/v4l/v4l2-selection-targets.rst      |   9 +-
 .../userspace-api/media/v4l/v4l2.rst          |   9 +-
 .../media/v4l/v4l2grab-example.rst            |   9 +-
 .../userspace-api/media/v4l/v4l2grab.c.rst    |   9 +-
 .../userspace-api/media/v4l/video.rst         |   9 +-
 .../userspace-api/media/v4l/videodev.rst      |   9 +-
 .../media/v4l/vidioc-create-bufs.rst          |   9 +-
 .../media/v4l/vidioc-cropcap.rst              |   9 +-
 .../media/v4l/vidioc-dbg-g-chip-info.rst      |   9 +-
 .../media/v4l/vidioc-dbg-g-register.rst       |   9 +-
 .../media/v4l/vidioc-decoder-cmd.rst          |   9 +-
 .../media/v4l/vidioc-dqevent.rst              |   9 +-
 .../media/v4l/vidioc-dv-timings-cap.rst       |   9 +-
 .../media/v4l/vidioc-encoder-cmd.rst          |   9 +-
 .../media/v4l/vidioc-enum-dv-timings.rst      |   9 +-
 .../media/v4l/vidioc-enum-fmt.rst             |   9 +-
 .../media/v4l/vidioc-enum-frameintervals.rst  |   9 +-
 .../media/v4l/vidioc-enum-framesizes.rst      |   9 +-
 .../media/v4l/vidioc-enum-freq-bands.rst      |   9 +-
 .../media/v4l/vidioc-enumaudio.rst            |   9 +-
 .../media/v4l/vidioc-enumaudioout.rst         |   9 +-
 .../media/v4l/vidioc-enuminput.rst            |   9 +-
 .../media/v4l/vidioc-enumoutput.rst           |   9 +-
 .../media/v4l/vidioc-enumstd.rst              |   9 +-
 .../userspace-api/media/v4l/vidioc-expbuf.rst |   9 +-
 .../media/v4l/vidioc-g-audio.rst              |   9 +-
 .../media/v4l/vidioc-g-audioout.rst           |   9 +-
 .../userspace-api/media/v4l/vidioc-g-crop.rst |   9 +-
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst |   9 +-
 .../media/v4l/vidioc-g-dv-timings.rst         |   9 +-
 .../userspace-api/media/v4l/vidioc-g-edid.rst |   9 +-
 .../media/v4l/vidioc-g-enc-index.rst          |   9 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   9 +-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst |   9 +-
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |   9 +-
 .../media/v4l/vidioc-g-frequency.rst          |   9 +-
 .../media/v4l/vidioc-g-input.rst              |   9 +-
 .../media/v4l/vidioc-g-jpegcomp.rst           |   9 +-
 .../media/v4l/vidioc-g-modulator.rst          |   9 +-
 .../media/v4l/vidioc-g-output.rst             |   9 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst |   9 +-
 .../media/v4l/vidioc-g-priority.rst           |   9 +-
 .../media/v4l/vidioc-g-selection.rst          |   9 +-
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst     |   9 +-
 .../userspace-api/media/v4l/vidioc-g-std.rst  |   9 +-
 .../media/v4l/vidioc-g-tuner.rst              |   9 +-
 .../media/v4l/vidioc-log-status.rst           |   9 +-
 .../media/v4l/vidioc-overlay.rst              |   9 +-
 .../media/v4l/vidioc-prepare-buf.rst          |   9 +-
 .../userspace-api/media/v4l/vidioc-qbuf.rst   |   9 +-
 .../media/v4l/vidioc-query-dv-timings.rst     |   9 +-
 .../media/v4l/vidioc-querybuf.rst             |   9 +-
 .../media/v4l/vidioc-querycap.rst             |   9 +-
 .../media/v4l/vidioc-queryctrl.rst            |   9 +-
 .../media/v4l/vidioc-querystd.rst             |   9 +-
 .../media/v4l/vidioc-reqbufs.rst              |   9 +-
 .../media/v4l/vidioc-s-hw-freq-seek.rst       |   9 +-
 .../media/v4l/vidioc-streamon.rst             |   9 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   9 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   9 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   9 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   9 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   9 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   9 +-
 .../media/v4l/vidioc-subdev-g-selection.rst   |   9 +-
 .../media/v4l/vidioc-subdev-querycap.rst      |   9 +-
 .../media/v4l/vidioc-subscribe-event.rst      |   9 +-
 .../userspace-api/media/v4l/yuv-formats.rst   |   9 +-
 LICENSES/deprecated/GFDL-1.1+                 | 366 ++++++++
 LICENSES/deprecated/GFDL-1.2                  | 408 +++++++++
 arch/Kconfig                                  |   2 +-
 init/Kconfig                                  |   2 +-
 mm/Kconfig                                    |   2 +-
 mm/nommu.c                                    |   2 +-
 443 files changed, 1801 insertions(+), 4023 deletions(-)
 rename Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} (100%)
 rename Documentation/{bus-virt-phys-mapping.txt => core-api/bus-virt-phys-mapping.rst} (100%)
 rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
 rename Documentation/{process => core-api}/unaligned-memory-access.rst (100%)
 rename Documentation/devicetree/{booting-without-of.txt => booting-without-of.rst} (90%)
 rename Documentation/{mailbox.txt => driver-api/mailbox.rst} (100%)
 rename Documentation/trace/{ring-buffer-design.txt => ring-buffer-design.rst} (57%)
 create mode 100644 LICENSES/deprecated/GFDL-1.1+
 create mode 100644 LICENSES/deprecated/GFDL-1.2

-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
