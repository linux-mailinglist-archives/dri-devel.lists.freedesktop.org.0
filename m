Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMDDL/5OcmnpfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:23:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E569D47
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC25710E9F4;
	Thu, 22 Jan 2026 16:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="Hu+gkBS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230E810E9F4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:23:21 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 191FF33F9DA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:23:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1769098999; bh=PgfXXowprx8l1j4KQrAvUuzHf57GYkyHDe6d/fX5x5Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Hu+gkBS7+hqSMbieEZ3sqcsdXksXTOo7O0gIWWNFNnPDnZVsCXgtQEGTa0eFOir65
 QWGNHAwrVcio4AtF7IkXMBZMobsuX3rFjwtzesCH+r7I/DHMpc9RRmJgb9sDzxmITF
 ppgC671hyLztnNo0iwwKCfzlzs4wXCc4FanzDMz9MeQRPWYu+ZyUzMvPbFR43ZDEtz
 Q5EHkrsQg5AgIpTK037zHQuQDHX4YuXb76gwdQ8TWDoBCuAUMPQIjpgL/r096VCfm4
 AvLi0sY6vYIPol6cR0fFg+v2k8ia/fimHlJWHqBCy/6RzgDG7N9QtiTRWqKd/Nrliz
 ixoSGMOaVijXA==
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6481bd1763bso1490526d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 08:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEPhnnMMLvxiOBxq1fJx+mH6deIvk4WIJWR5wnjsnKZSeN4krI5MsHFpgtgfSBfv+D/9POjedusYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQEbOYXFyhq3fA9q4pziZCC6MBF7/UXxMlIPpialhm61RG+Kv3
 rEjVvItXosT6Vu6FCexjEOKcLhPneknVq8/GK8vLJxvzivcKUS0ni2oomucjM14WfutLfFKr/x4
 OCpG+VUobv0Ce+RVg6fI1r8815/JRHMM=
X-Received: by 2002:a05:690c:6809:b0:793:c8ab:8bc5 with SMTP id
 00721157ae682-794399dbb62mr329177b3.46.1769098997747; Thu, 22 Jan 2026
 08:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
 <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
 <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
 <d481788c-227f-479f-bc2a-7e30d55832bd@intel.com>
In-Reply-To: <d481788c-227f-479f-bc2a-7e30d55832bd@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 22 Jan 2026 17:23:06 +0100
X-Gmail-Original-Message-ID: <CAFZQkGwi4rDETVto2gStr0faNWNVzdhzoR4Akj1MVNYoDVw4XA@mail.gmail.com>
X-Gm-Features: AZwV_QhCWBDUaUJYmXroAnhWrWZ0nTSaaqnzjcJ_2ageBiz7Z4TcmlXq9iapCgA
Message-ID: <CAFZQkGwi4rDETVto2gStr0faNWNVzdhzoR4Akj1MVNYoDVw4XA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[kde.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:arun.r.murthy@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:harry.wentland@amd.com,m:uma.shankar@intel.com,m:louis.chauvet@bootlin.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xaver.hugl@kde.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,amd.com,bootlin.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kde.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 920E569D47
X-Rspamd-Action: no action

> No new UAPI is added for this and would be enabled by default with
> atomic ioctl.
I didn't mean a client cap, but a driver one. The compositor needs to
know that it can set the reserved field to a non-zero value without
the kernel rejecting that commit.
