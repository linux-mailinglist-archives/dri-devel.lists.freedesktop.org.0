Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDPUE4pSf2knoAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 14:18:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D14C5FCA
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 14:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56A110E084;
	Sun,  1 Feb 2026 13:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="FN9A9CZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 611 seconds by postgrey-1.36 at gabe;
 Sun, 01 Feb 2026 13:17:56 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31D810E084
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com; h=To:
 From: Subject: Message-Id: Date: Content-Type: Content-Transfer-Encoding:
 Mime-Version; q=dns/txt; s=fe-953a8a3ca9; t=1769951875;
 bh=Zc1J9AP3jlJ/fOzEPvNm5JFkGDak84VSRJgnpSBh5A0=;
 b=FN9A9CZiywnKN1CFzlBA+Q9viVpsBC9qiU/2iQL8MconStR7mk72l4OJrGbsbjdXTHI818WgG
 qm2ORCblE3y7FiIIIUqgxq9xaBAM0PsiGamO+zEC9F9oN7PzWnoDGvjargF5/SasVvHLjgWxCIm
 8QZIf8L2JizKSX9M2h2IgKUP1RYtmwIWDUnPb1Ut1Yx8JJqQjlUCiMmeiSuL80ONMBJEHb9bV2y
 Gh+/LPw6lZNa+dE2JiXbxMu/hfPfaxMqSStC8HZRjKCMmUaZu/8AwTMO7K/x4q3lgFLSY/r6a9O
 4x3Zy1yJxnZf6bN/pk0wfocp/BoMHmIbIMLh/58Dh0wQ==
X-Forward-Email-ID: 697f501cbd58725a2051d6fd
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.5.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 01 Feb 2026 08:07:38 -0500
Message-Id: <DG3NCV9IJEVJ.2RCME8DUAM4N4@ubuntu.com>
Subject: [Question] edid: Parsing of CTA_DB_SPEAKER tags?
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
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
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B2D14C5FCA
X-Rspamd-Action: no action

Hello all,

As I've continued to understand more of drm_edid as a newbie, I noticed
that in drm_parse_cea_ext, the CTA_DB_SPEAKER tag is unhandled in the
chain of CEA data block parsing. (This is drm_edid.c)

I see that in a few other functions, CTA_DB_SPEAKER is handled, like in
drm_edid_to_eld and drm_edid_to_speaker_allocation. However, the latter
is apparently used for legacy interfaces, and the former is just
defining a pointer in the ELD to the data block.

drm_edid_to_speaker_allocation is in amdgpu and radeon drivers.
In amdgpu_dm_helpers.c, that function is used in the
dm_helpers_parse_edid_caps helper to parse edid capabilities.

The reason I'm mentioning all of this is because, unless I'm looking
at the wrong information, the SADB contains info about where the
speakers are in the device, which seem to be unparsed. Is it worth
trying to implement support for parsing this?

Alternatively, perhaps in drm_parse_cea_ext we also set the display
info's "has_audio" field to "true" on CTA_DB_SPEAKER, like it currently
does for CTA_DB_AUDIO.

I know eventually, after drm_parse_cea_ext, drm_edid_to_eld is called,
but for the sake of "completeness" we may be missing it :)


Thanks,
Josh
