Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHiINA8PhWms7wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:43:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6BF7C5B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708BD10E12F;
	Thu,  5 Feb 2026 21:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="KQJ2zhzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 819 seconds by postgrey-1.36 at gabe;
 Thu, 05 Feb 2026 21:43:39 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F68910E12F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com; h=To:
 From: Subject: Message-Id: Date: Content-Type: Content-Transfer-Encoding:
 Mime-Version; q=dns/txt; s=fe-953a8a3ca9; t=1770327818;
 bh=pjbwI8/toe4jBT0dkLZbWij8hg+Aoe8jhtwClB49npI=;
 b=KQJ2zhzco3Kx6dwREY/I1mo373bdAhl7X+yxZnb28MxOtT7KLNtWv3yo/Dn2DSPgtjk/AaUNR
 GME2dWh+t+ZhzL1tzjXsL5Lxv6XEG4Qq0itsZLjd3PrOj6/FCJy9B7w6LzKkbd+EGzmyHgDsJ0+
 a0b8or4WRzWzPtL7yt914+t/7m10LAy7fUdGI23Fye6Xp+RcIrHUSdEIaKijMknicgj0C2zHq5p
 HqAmI0fOQvbXFzeQaC8Cye/q4Gp9tH68V8tPbdIZ5kq0Urr/aGYWU8UjW8uYTqhOp2iGBBy6AvO
 vifNyRXTi4F1iaF1arvCHCHsNQlKzGgy3TuguSEoFVwg==
X-Forward-Email-ID: 69850bd58a29473a36a7b980
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Thu, 05 Feb 2026 16:29:52 -0500
Message-Id: <DG7CJKUR1SN4.1ZXQ6OIU28Z4D@ubuntu.com>
Subject: amdgpu_connectors: move to drm_edid?
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ubuntu.com:mid,ubuntu.com:dkim]
X-Rspamd-Queue-Id: 4DC6BF7C5B
X-Rspamd-Action: no action

Hi everyone,

While looking for things to do, I found that amdgpu_connectors
is using drm_connector_update_edid_property, which according to docs
is deprecated in favor of drm_edid_connector_update.

This would be a drop in replacement, but the second parameter is now
struct drm_edid instead of just struct edid. So this would mean
updating amdgpu_connector's edid field to be of type drm_edid.

Is this something still desired?

Thanks,
--
Josh
