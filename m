Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB/wIlIwf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33DAC5A29
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A06E10E080;
	Sun,  1 Feb 2026 10:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=worksmobile.com header.i=@worksmobile.com header.b="VRlf99WR";
	dkim=pass (1024-bit key; unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="RYnccFSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 601 seconds by postgrey-1.36 at gabe;
 Sat, 31 Jan 2026 15:20:10 UTC
Received: from cvsmtppost101.wmail.worksmobile.com
 (cvsmtppost101.wmail.worksmobile.com [125.209.209.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A92B10E154
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
 s=s20171120; t=1769872207;
 bh=Az7QnQeyC1E8ORYDlfmVMdJfoi+Y8rBrL9Nrs/zWs0g=;
 h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
 X-Works-Security;
 b=VRlf99WRaMChsWisji4uO+ae48FYxl7nxKC+plGjc0oBKSUL1rTt7a4tfCW4kt5G3
 rE4m0OfbitQjoY1zNs4Gmn5g0qBUAy1DNsRIOW8KSpBWIlWTpjE8oUkRx+uTh5WCl0
 OWVC6D/z67JuXAgDrSV8VCAb6gbA2Q+c1F+nlzUKldEq4IJrWTw4GJUExv+egdLR+4
 qmi/MvO26xnFL5roxpN2byEYE10SJgLsdUm1Jq+owAljbgzrpXv0Q55wrfO9+x0qSt
 pWx1O3TsoCH5d8IcjX1Lzk0yxC2cGO5xwlRIqJUICrK0P24fccVQ8Z3WHdAkPqyqZ2
 76Qp8kM7nreCg==
X-Originating-IP: 163.152.163.130
Received: from cvsendbo001.wmail ([10.113.20.163])
 by cvsmtppost101.wmail.worksmobile.com with ESMTP id 9jd6u8gZQQKns1gN30Kfjw
 for <dri-devel@lists.freedesktop.org>;
 Sat, 31 Jan 2026 15:10:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
 s=naverworks; t=1769872207;
 bh=Az7QnQeyC1E8ORYDlfmVMdJfoi+Y8rBrL9Nrs/zWs0g=;
 h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
 X-Works-Security;
 b=RYnccFSCFEDkTU5B6ZLv+tJNp3kE2sulz7HtA7mZUUjB01xKSjPRAnNhvP+MBGyyE
 I0lUvicV62qMZleVE5HBt7+gFbMkXHdyPWbfvBOSyAj+RqCG9SIYtYlw8qd/ZA4fIF
 H/PtiM0gzAO7ucbTMw+q033N9q4huKum0oxJuzbQ=
X-Session-ID: QUTATe9TTayTEu76AXDqwg
X-Originating-IP: 163.152.163.130
X-Works-Send-Opt: kendjAJYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: VdYqaAvrFqJZ+HmrKA2l+6E=
Received: from s2lab05.. ([163.152.163.130])
 by cvnsmtp103.wmail.worksmobile.com with ESMTP id QUTATe9TTayTEu76AXDqwg
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 15:10:06 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, javierm@redhat.com, deller@gmx.de,
 Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [Question] Dead code in aperture_remove_all_conflicting_devices()?
Date: Sun,  1 Feb 2026 00:10:06 +0900
Message-Id: <20260131151006.3296961-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:51:49 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[korea.ac.kr,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[worksmobile.com:s=s20171120,korea.ac.kr:s=naverworks];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,redhat.com,gmx.de,korea.ac.kr];
	DKIM_TRACE(0.00)[worksmobile.com:+,korea.ac.kr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ingyujang25@korea.ac.kr,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sun4i_drv_driver.name:url]
X-Rspamd-Queue-Id: F33DAC5A29
X-Rspamd-Action: no action

Hi,

I noticed that in drivers/video/aperture.c, the function
aperture_remove_conflicting_devices() always returns 0.

The function (at line 284) simply performs:
  - sysfb_disable(NULL)
  - aperture_detach_devices(base, size)
  - return 0

The wrapper function aperture_remove_all_conflicting_devices()
in include/linux/aperture.h (line 57) calls this function
and also always returns 0.

However, multiple DRM drivers check the return value and have
error handling:

1. drivers/gpu/drm/vc4/vc4_drv.c (line 364):
   ret = aperture_remove_all_conflicting_devices(driver->name);
   if (ret)
       goto err;

2. drivers/gpu/drm/sun4i/sun4i_drv.c (line 103):
   ret = aperture_remove_all_conflicting_devices(sun4i_drv_driver.name);
   if (ret)
       goto unbind_all;

Since aperture_remove_conflicting_devices() never fails, these
error paths appear to be dead code.

Is this intentional defensive coding for potential future changes,
or could this be cleaned up by making the function return void?

Thanks,
Ingyu Jang
