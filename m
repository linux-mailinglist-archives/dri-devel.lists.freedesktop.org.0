Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMDtFiU2oWnRrAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:13:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB3E1B30EE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB77810E0D8;
	Fri, 27 Feb 2026 06:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lMVu9BTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11A310E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 06:13:52 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-896fb37d1f0so27785966d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 22:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772172832; cv=none;
 d=google.com; s=arc-20240605;
 b=a1+7IKJbvdybvaemoz5vu65b3yz83e0rXCLkNVUrgjTVMt8LXzgMrpX5Usji75+gjN
 oBbLYOuN6cqEREPj8bZbiZeBWXC8bKirNO6AfU+Nem5ofxKgeX3Zh3WiAqBzXrcDAFvK
 GqGrW3pzbgP6r3xxLsTEN8dqigyckFHo9/Qijm6pPhcT2LhI6ZkTPkMsul+1fj3bhH3s
 Cx9lRJgGprHDo+SyfYHiSjlr1lyTbcDM7oxBnckkpmObUNJY0cDcaxP3VcXQukZkeHIC
 bzbNlZ9tPOblmwc/Eg3P7iZ3YhYD+kAaLPk/vlxH+1q9FJsfqDs1cjQOVyAODt2lUkZZ
 T7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=ImvvcMOaZhHLJMCf3gf7zcrAEaNNNGrpB4vKL9k8XTA=;
 fh=A08XZwmmb57jzirbgTkluPSvjDeiJMkkojF1n6qDmTk=;
 b=Kcz7+Hkgcg1mBlbmKXkg2/qPh7YN0uoEVuQhZNtc+JQ2j0NXp3wWgZUnXfScjiMcHV
 pcM5crparIQy/6b8Y6vWvCm1R8Tl+JmrFtYX6G6B+eZiPIbBVJ70kz92FaTv1Y0LKdk1
 3otXqkxMhHBhFBqE9ZtA7Pp9NYLAEyLGidMgFFavrPXGpWg9QF9LtVhYFeebvHK5IT6A
 fSw4NaoJKNlTfPy/4yjc2hdZkB+IGqtsRXkD8gVeuuPkxRJPaUr6Fqxn+zkBRVHAQ24y
 gFVsF3//W9s6l9dLrHIlwrOlFC6dzzlTc/nBKiLOwKUA0VxawV8NuCwhgGPImt34yRmA
 JG2w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772172832; x=1772777632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ImvvcMOaZhHLJMCf3gf7zcrAEaNNNGrpB4vKL9k8XTA=;
 b=lMVu9BTY9l376Lk4DWyXRO0ExNr76F1Knv8rfaH29b7BsX4t29Pq3H/q2Ep187OW9S
 CTIPXfFTFdkmZ9ejqEw4vAuk1pPMUYczs7tYvQiI4UPDkYDHzD4/P+8q7ET5Og57dPxO
 /yQZzxpLtst0S+HpgXd+naeEuUUl9aj3OF4l9RFtIC6nm3DDbxaLWDzZ1CCpdJy0syvU
 i8HH2XfztOYgOJbUezFHORi+PDh3zCXV1gcoI4l4jmuGJ7zT5V+OeF6+qk+I/Vb1Qwd+
 N/e/pvZhSQWeCPYgDLpU9++0ox7P9cy2FYKH0d1a8+BAaq6+yZuODpNrDZk7vXpJn5JH
 ho9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772172832; x=1772777632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImvvcMOaZhHLJMCf3gf7zcrAEaNNNGrpB4vKL9k8XTA=;
 b=PWfpHjZRkab7Gh2whPCsR99EJhbhzrc3pqWVC1nMfMtmppY2Jxo5RHhyBk1VClSTeF
 cGcugelwlx1oSF+DqDVUA5Nueq/X+no1VBqU+xPFrBccp+FNZ878vIgB75n88eqpuPD7
 Coc2QGiCMDKJuknyZtmCOpjEvJPnB0J9xvkV6aYVmVkJDW3ADy5Z+k46joRt8UVE4EwE
 uiO79+YQoSfocaqsvZqC0EibH4N/YBZWgSGu0/x35mC2P7kOdcwIi5R5NSa3hj8e+VPp
 Xrvk91WRax8ueAkQ8FFYfNq8cwkHnZu0xlfgJSBV6pWTSXmw6tbEYMWo0cBkrzqJnyth
 zEVg==
X-Gm-Message-State: AOJu0YyAnoQC/4rj8fvdUV5nP3kAw4NWimy8yocb66PYm5HrXTyclB7p
 PGGHL9S+vIDJCFYwzcmAcSGLBRjn608GsaRE/c2gm61P904iOZt1PcYC7k40htIQl6F6NdYi9cp
 CCXN3+TYkNiIDjVBZcg2nA2pMI3nzrss197sh3/E=
X-Gm-Gg: ATEYQzxYok2V0lYOLE/iG+Y/V2YpsITzM5Dtj7r7d8SU15QKPSut6SAaNsUlpQAKuNO
 r9emdCA1VC0HdO/XHlALO+cCHmOWq3QWRImXGoSXAxaNI2Aom6zEQr9h0em98NSDaW6VSyVJD/R
 9Ip0C2W1pBNLqKoLirhC9tlNlEWqKC7pD+xQ/SX6W65nl5vYaFlePrROPjKb8cMgim7aLhD3MUs
 CZo9z3EcOhGNc3/fw6ZlNJYkoX6FM0jf2c3JX626keIrl/nnZWLhrwMn91KeOaSaIsGWfkyw9bg
 IM35+z58/7/MmH5+qYsTEHXcr/XHY3U+ButTIqhUwjTnQR3c4d0p4O29i6g/no0adlM=
X-Received: by 2002:a05:6214:2265:b0:895:4741:9f06 with SMTP id
 6a1803df08f44-899d1e3f02amr27129756d6.41.1772172831620; Thu, 26 Feb 2026
 22:13:51 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Feb 2026 16:13:40 +1000
X-Gm-Features: AaiRm51_2stvti0XhKBNLi93yqy35NKk20Zr-5oJ4MonTi7ul42FndCWE7c0H9k
Message-ID: <CAPM=9twT7RhgErNvOEjOGY1UUtLY-Z8koZGe6TXLc3gZ_tuePw@mail.gmail.com>
Subject: [git pull] drm fixes for 7.0-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: BAB3E1B30EE
X-Rspamd-Action: no action

Hi Linus,

Regular fixes pull, amdxdna and amdgpu are the main ones, with a
couple of intel fixes, then a scattering of fixes across drivers,
nothing too major,

Regards,
Dave.

drm-fixes-2026-02-27:
drm fixes for 7.0-rc2

i915/display:
- Fix Panel Replay stuck with X during mode transitions on Panther Lake

xe:
- W/a fix for multi-cast registers
- Fix xe_sync initialization issues

amdgpu:
- UserQ fixes
- DC fix
- RAS fixes
- VCN 5 fix
- Slot reset fix
- Remove MES workaround that's no longer needed

amdxdna:
- deadlock fix
- NULL ptr deref fix
- suspend failure fix
- OOB access fix
- buffer overflow fix
- input sanitiation fix
- firmware loading fix

dw-dp:
- An error handling fix

ethosu:
- A binary shift overflow fix

imx:
- An error handling fix

logicvc:
- A dt node reference leak fix

nouveau:
- A WARN_ON removal

samsung-dsim:
- A memory leak fix

tiny:
- sharp-memory: NULL pointer deref fix

vmwgfx:
- A reference count and error handling fix
The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-02-27

for you to fetch changes up to 103d53eb6fb11cfc3d502eb7b6efa706e139b947:

  Merge tag 'amd-drm-fixes-7.0-2026-02-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2026-02-27
09:19:47 +1000)

----------------------------------------------------------------
drm fixes for 7.0-rc2

i915/display:
- Fix Panel Replay stuck with X during mode transitions on Panther Lake

xe:
- W/a fix for multi-cast registers
- Fix xe_sync initialization issues

amdgpu:
- UserQ fixes
- DC fix
- RAS fixes
- VCN 5 fix
- Slot reset fix
- Remove MES workaround that's no longer needed

amdxdna:
- deadlock fix
- NULL ptr deref fix
- suspend failure fix
- OOB access fix
- buffer overflow fix
- input sanitiation fix
- firmware loading fix

dw-dp:
- An error handling fix

ethosu:
- A binary shift overflow fix

imx:
- An error handling fix

logicvc:
- A dt node reference leak fix

nouveau:
- A WARN_ON removal

samsung-dsim:
- A memory leak fix

tiny:
- sharp-memory: NULL pointer deref fix

vmwgfx:
- A reference count and error handling fix

----------------------------------------------------------------
Bart Van Assche (2):
      drm/amdgpu: Unlock a mutex before destroying it
      drm/amdgpu: Fix locking bugs in error paths

Brad Spengler (1):
      drm/vmwgfx: Fix invalid kref_put callback in vmw_bo_dirty_release

Chen Ni (2):
      drm/imx: parallel-display: check return value of
devm_drm_bridge_add() in imx_pd_probe()
      drm/bridge: synopsys: dw-dp: Check return value of
devm_drm_bridge_add() in dw_dp_bind()

Dan Carpenter (1):
      accel: ethosu: Fix shift overflow in cmd_to_addr()

Dave Airlie (5):
      nouveau/gsp: drop WARN_ON in ACPI probes
      Merge tag 'drm-intel-fixes-2026-02-25' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-02-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-02-26' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.0-2026-02-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Ethan Tidmore (1):
      drm/tiny: sharp-memory: fix pointer error dereference

Felix Gu (1):
      drm/logicvc: Fix device node reference leak in logicvc_drm_config_par=
se()

Franz Schnyder (1):
      drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used

Ian Forbes (2):
      drm/vmwgfx: Set a unique ID for each submitted command buffer
      drm/vmwgfx: Return the correct value in vmw_translate_ptr functions

Jonathan Cavitt (1):
      drm/client: Do not destroy NULL modes

Jouni H=C3=B6gander (1):
      drm/i915/alpm: ALPM disable fixes

Lijo Lazar (1):
      drm/amdgpu: Fix error handling in slot reset

Lizhi Hou (10):
      accel/amdxdna: Remove buffer size check when creating command BO
      accel/amdxdna: Switch to always use chained command
      accel/amdxdna: Fix crash when destroying a suspended hardware context
      accel/amdxdna: Fix dead lock for suspend and resume
      accel/amdxdna: Fix suspend failure after enabling turbo mode
      accel/amdxdna: Fix command hang on suspended hardware context
      accel/amdxdna: Fix out-of-bounds memset in command slot handling
      accel/amdxdna: Prevent ubuf size overflow
      accel/amdxdna: Validate command buffer payload count
      accel/amdxdna: Use a different name for latest firmware

Mario Limonciello (2):
      accel/amdxdna: Reduce log noise during process termination
      drm/amd: Disable MES LR compute W/A

Matt Roper (1):
      drm/xe/wa: Steer RMW of MCR registers while building default LRC

Matthew Brost (1):
      drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Natalie Vock (1):
      drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink

Osama Abdelkader (1):
      drm/bridge: samsung-dsim: Fix memory leak in error path

Shuicheng Lin (2):
      drm/xe/sync: Cleanup partially initialized sync on parse failure
      drm/xe/sync: Fix user fence leak on alloc failure

Simon Ser (1):
      drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats

Sunil Khatri (2):
      drm/amdgpu: add upper bound check on user inputs in signal ioctl
      drm/amdgpu: add upper bound check on user inputs in wait ioctl

Tvrtko Ursulin (2):
      drm/amdgpu/userq: Fix reference leak in amdgpu_userq_wait_ioctl
      drm/amdgpu/userq: Do not allow userspace to trivially triger
kernel warnings

sguttula (1):
      drm/amdgpu/vcn5: Add SMU dpm interface type

 drivers/accel/amdxdna/aie2_ctx.c                   | 32 ++++++-----
 drivers/accel/amdxdna/aie2_message.c               | 15 +++--
 drivers/accel/amdxdna/aie2_pci.c                   | 40 +++++++++----
 drivers/accel/amdxdna/aie2_pm.c                    |  2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                | 24 ++++----
 drivers/accel/amdxdna/amdxdna_gem.c                | 38 ++++++-------
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  3 +
 drivers/accel/amdxdna/amdxdna_pm.c                 |  2 +
 drivers/accel/amdxdna/amdxdna_pm.h                 | 11 ++++
 drivers/accel/amdxdna/amdxdna_ubuf.c               |  6 +-
 drivers/accel/amdxdna/npu1_regs.c                  |  2 +-
 drivers/accel/amdxdna/npu4_regs.c                  |  2 +-
 drivers/accel/amdxdna/npu5_regs.c                  |  2 +-
 drivers/accel/amdxdna/npu6_regs.c                  |  2 +-
 drivers/accel/ethosu/ethosu_gem.c                  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 17 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         | 12 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    | 22 ++++++--
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  5 --
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  5 --
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  4 ++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  4 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              | 23 +++++---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  6 +-
 drivers/gpu/drm/drm_client_modeset.c               |  3 +-
 drivers/gpu/drm/drm_gpusvm.c                       | 10 ++--
 drivers/gpu/drm/i915/display/intel_alpm.c          |  7 +--
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  4 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 12 ++--
 drivers/gpu/drm/tiny/sharp-memory.c                |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |  4 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |  9 ++-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |  6 ++
 drivers/gpu/drm/xe/xe_gt.c                         | 66 ++++++++++++++++++=
----
 drivers/gpu/drm/xe/xe_sync.c                       | 30 +++++++---
 include/uapi/drm/drm_fourcc.h                      | 12 ++--
 40 files changed, 300 insertions(+), 161 deletions(-)
