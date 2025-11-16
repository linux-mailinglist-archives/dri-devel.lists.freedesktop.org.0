Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1BC60E05
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 01:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB0910E06F;
	Sun, 16 Nov 2025 00:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="j9wmxEho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-25.consmr.mail.ne1.yahoo.com
 (sonic311-25.consmr.mail.ne1.yahoo.com [66.163.188.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9221210E03D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 00:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1763252841; bh=6NNeInWLMrdU4WkCxYisXw5SOxQ6+dBJcNmbER8O29s=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=j9wmxEhomeeQJ5OWlzoigQNYZYDFn9gPJ6fbiVZiTs5NvnjdJ8DC9DfrufGjdCiPUdvFtHsAcxNDDEtXwfGIQOKnt2ZgDSLxkTsvhLN4l8HgEjbvIxrHI6RNtGB+HsDjwIcDoltjFGlngmFyx0rHdZA+KSWTJbXx0VPfIv9ZrDskEqKk0NFyOMYDbNTOLTyQjfKSAltaG0Os0rPfQEtmjYLIDRv7bQM/v/7tN/w41/m6Xnkh4Gxk8OVyaWW3cwAgbyguEh77acqEv1VoNM2Aap8v9QwpfP2Q2yIO7y53mF9TyYb0vHaEkbkq/VDTCL42O4boG+3XvF9132IeyjvmIQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1763252841; bh=VwKxgkWfqeQmipnJo6TSCTrGj8mkHiO2nExBWi11Rw9=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=NhY6ObYtxVsukNnwyb07L4LIdodGOaFj6qbMRymbWsQAK1OZzfVZiiEK8cb+T6Krh/lO40RcY+KY6J+xgApWSs4B4QwBqj3e7rYMrXza5+J9j4AVoi8LvHjWzEDTot7AX8UniTYg7GG89XWHsNAHQIVzk0JMk4ET7RPK76/QfjFv9sky73+wWb55Raz7eQ/RkJJrqG87y4ZtqlrZya8uF9oZqjJ7M4FPVVOCbOLnYdm8+M1aXF2Xth9FkF1ZIrhnSVmH0KVLixun0ld0hqr1K8tu4QDNvrdJhOKuqfhq7Up1EQEhVui4cs12uf3Lbf4wcrEsckyrlxCKSJdJL107zg==
X-YMail-OSG: LIGgRXMVM1mFDrwxcXisxLr_sQVcDCnCXcvN4nBZWdtuS1xx1OP8d2Ri9c7gNyU
 n4au9UAIIMcLYxya4yqJ0zUP3i3LvOTbMXjSu7Zej69HLXQGLAU1sD97Z7PZgTX4iAPozvsJnpW4
 yYc7.X7f6HtJ19p11366xtpC02X3RkJ.R8HcAllk_558nvB0Zab5DcELROLpmqm7FQWjRHrJU14p
 rvgcI5AklE_WbWT9VaE5flK3B8CsMubNcbpCyVY39G5AWoxxoG_bdYMaoTG0piwWqqJ_pIGv588R
 5nBFkpk2jtgETTAifib0duUDxPbcAVA1O7SibZZxz_sp3X84eY7_8fqQEvreqTYl1adeTF9fKU5X
 BiUIJzD33JyYrSR8mO9n5ikDKF7QA4W1mrdXuYWPGeGMOZ00ZJINT6ZSEdedGDHZ5zK8RTOxTLFa
 xuO2CEVyxXfH5n1JsacdFByzvj_eb.Z7uDuxr6NK2x5fpqbzEu32KTRxPMpcBfzSjJcn0bTZvlq6
 b6cQGb6rg8_Fis7q2WFKZiGtyP70h6lEbD2FLhZHS9pogeTYfm2b5q4uOM.zWTnhN70xhFJ8lXr.
 mV_u.OOWJegjyzLPQraPC6IbsY4IZLmhc7FoOpllB0LlQaRvChKt3cfM2zMiGZqpxx2QTN73G4S9
 LZlXVCEhe99PEjXNi4uOrao9n9izs5WKMiaWReI.jkaPiqKS69YeXb_6lLndizXT9XJ9XsKVdu7y
 qCgkyQeVYK0vkmYbVpJtDzceKZhf4TSX7VE4MmygA3FMNARoVo5bGbEhFot1I4Km04RZRvfKZ9u8
 M88n.f1vpMHxfyftIaRA0M4WtPo8HjLrUQWIssEWAeGwX5uDU6GdX4.gYCF0fDTkL9zjIX4US2fh
 z1bv4HsgrX54ml8j0s384WKkr6YOPSuIs_b8A__zM60elimiO54fgjoRWEwijn47WE.wCD7urasn
 p7_UuM5X0_ju86yJKFjgHI5sa2pmQxiRX3S_X19lBILqUgU_0jxFWv0oTue22gcU2T40pUm4.Zca
 dR7PrhdbyhXxQnoaRc6dWUyF7EN5ajB.7eQlKEG09c6mizsiuista_153C9H7xMgaVpDKChS.Oh1
 cSrOnCW_8az4EjPMOlf2H3FgXqHSbLbwobZ1k5XvO2k9TCU_Wf9GLn1FNHQIOvMjGItioenXYEQK
 hOpseHQrXZgPHbGCOa6jYB1koWM28rn5hNYtBdFShzz_IgZ1z5U5HWXmEz63_YW0LbZiAFJjVuk.
 .pBp32rCczhwwZcjG_Uy_NoWNfxlne4F5cAB3aOFLV2w78HVz6y31PYVNtBahMvZRemJKSPVhu6P
 BpVOMc_Hixi.C7UN5cpvUzYcoarYPqFJSt6KI1AxFVD1oohBY.6kAbQhlOhUoV3TebXh_yAEGNRw
 07JCGMd8n74uYi86n7bPWOIwnllC9NLTTau1jAIQk3e4MRD1mKLgiB1_v9fHv0bs7jDzJsKt0E8t
 TeQL3pXXixBsiv8Dsxq8aRBCmRlxjF1HRA3G_9WihxDHcQH1ulOC6ZRyJaGa6rV6UJDEBe40RfEV
 VnwB96_O47jR45AWgZcExIARRZPogVr2HgDFW8hvJJEmce3W7n.pon1EJaDxCj9vWQTZed9.h6f5
 SyrQXHUoId5HZtAI7cAJZUJUQ3prbfLb33p.eRPYfq2WkOKxt9NPLN32QC94Zzq7SwA7ONb2Qp2v
 5AUoajhMpdKDi4VjLTkMQPWNEtda98xOgJUxxHg6klRJCH.j8upVKBwlOJQdTegQ9_oeFvhgbYnH
 jnumK5UB67h07h._H7.PTGVT5tRIg3.Fd0SPzoaK_o46iHzh3QtOaatV6wjZ5Gs29JBR7MVFCmdL
 vrSCJNOzQBmpvXMWYv4QancLeup6BhRPuiP9EcGS3wfQs1kKK4_bD3NojSBoCS__n4kN_6.ItyXi
 b8FCZZ.oUhbQDBj_z9azMfap2r9VoKdOMW5ufUk.4QqlWCQ0nr18nAh0Yp9FFWtyMd3y5wi1SPMK
 zi5R_L8FTLUKYhoAO..wEg2V1U4RC3w2X9LX5eD54DtV8tuLtzZvEP2I92ovui4IC_HpYhFmZoXC
 cdJEXG0wfoet8kYY9wXYeO5SitJn8276IyzoTn9ssOG1r23z74mbKGC3rurK1ftO4BJ3Pa08n.s0
 Dlf4id0GOPl9feOsxlGcr18VWyihffReMJz3PgFmtLBcRqkCCSydDmDL_60kVLNsJEx9H8JvgbuI
 KESyjk1WHlOdUhUZGOnTA_juzIKTgBjanbzlK5tE3L7DM.YCs68krYvIxruY52hRmffAJopS0VnX
 1clWWPQ7gvKy_m3HN7kJ3hS4tpsH73p7ayiOAomI1YA--
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 31fd3172-12cc-4df1-8474-0da1c40ce8d6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Sun, 16 Nov 2025 00:27:21 +0000
Received: by hermes--production-bf1-58477f5468-k9hpl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3a3c42801977728ceadb395fe82b8b03; 
 Sun, 16 Nov 2025 00:27:16 +0000 (UTC)
From: lxrmrz732@rocketmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Ramirez <lxrmrz732@rocketmail.com>
Subject: [PATCH v3 0/2][RESEND] drm/nouveau: add and implement missing DCB
 connector values
Date: Sat, 15 Nov 2025 19:21:15 -0500
Message-ID: <20251116002628.21930-1-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20251116002628.21930-1-lxrmrz732.ref@rocketmail.com>
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

From: Alex Ramirez <lxrmrz732@rocketmail.com>

uconn.c's handling of display connectors was refactored for Linux v6.5,
causing a regression that issues a warning on boot for GeForce 8600m GT (MacBookPro4,1)
and likely other legacy GPUs.

Several connector types used to be implicitly supported before v6.5 by a branch in
[drm/nouveau/nouveau_connector.c:1353] that determined connector types using encoder
bits, but these connectors have since been left entirely unhandled after the refactor
due to the aforementioned kernel warning causing that branch to never be taken.

nv_connector->type is generally 0x0 (DCB_CONNECTOR_VGA) in the case of an unknown
connector because the WARN_ON macro in [drm/nouveau/nvkm/engine/disp/uconn.c:214]
causes nvkm_uconn_new to bail out before a suitable connector value is chosen;
it *seems* like the value is left undefined.

This patch set implements the missing DCB connector values per NVIDIA spec to fix the
root cause of the warning and changes the WARN_ON macro in uconn.c to a printk message
to more gracefully indicate unknown connector types, as was done pre-v6.5.

v2: Include better commit messages. My original submission was partially
blocked by a spam filter.

v3: Update NVIDIA documentation link according to Petr Vorel's suggestion.

Alex Ramirez (2):
  drm/nouveau: add missing DCB connector types
  drm/nouveau: implement missing DCB connector types; gracefully handle
    unknown connectors

 .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 +++++++++++-----
 2 files changed, 116 insertions(+), 41 deletions(-)

-- 
2.51.1

