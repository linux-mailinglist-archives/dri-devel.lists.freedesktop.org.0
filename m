Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MkaC8L7p2mlnAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:30:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D621FD965
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1800410E1BE;
	Wed,  4 Mar 2026 09:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CbACVGIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF02A10E1BE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:30:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso49603825e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772616636; x=1773221436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
 b=CbACVGIcQcxbQyCeWsG4sb0WsRIh99qRkO3bvVEdbdMUYKScNfOaPGjnL7aufnMbj1
 gYoa3mnyqY+7k2xOeFpz78zGuaHlPvukGfrlxJvkyPPG9g/rRNCfozER4kTQdOVYNamH
 a9F/HG2cQ/6j3RIgs8h1L2xfDPykm5l9rEnlFJ0Es9hUeYz0zv/elwqxGkCNehoqshue
 rCQooOaM9h37Bo6LDKzbAv23D53UD93woE5b1c0J0eeuNuxvHfH3xwqie5Z6xebLRMh4
 M5CRONHYNcl25pVh+6XOvNW1akMztJI+PXMzKqLGHwaYfj1LLx5mhVhzeld+6C5RTl2K
 T+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772616636; x=1773221436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
 b=ZXtdtNkPlFk9eFk/t3osg90e7ciXDOGvsATK2NwWQ2ZnApr6VyxxDHnywXHjjcqQZi
 t+peOjol4ZANSUpFspKsMsS2oG/1+qzPeL/RGEouOYlzy0o4sfQRCcSR6ERDJqJv23Fr
 HHX0Xdi2hbyUEMVPkxsUY++74KTuBlvBMMRWCgrurz+TbECDPB9BFkeWy7edO3mewTze
 OipYKk7yWZV931ARRYQL/xhPizLjv8VPKqJZqvB5ATOMfv0bgkiZx9NMjvR1wsG8UvwD
 Z58CduWePVneeCNDjj0+8z6V+orx4WYvO25Nsg30Rqt/+h8Qv4RzirO6xF+PweqcFa6s
 1urA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjwwDZcypa6z0AhtFB0p6TUThcX0Dxd7zY0bu8XwMtOQVg/v884nd0UqYCZ76QYvILzvyY8oufkL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXVHeBC8fKw9TSJek8RxzEk9E4J+LJTvwbK5/ueCBhe00WPP4b
 a3IOqto/e9wx8Qc6cRXKxrfqzGJg9antgCh55kvFKLZ0NxP6eH70ThKT
X-Gm-Gg: ATEYQzxyz9L/dOL5+x+hG7f1KvxOsXPLkNo0pOJpwbj4IWvap3YyL8Kyj6zX6jF4WQK
 zTokJuIVL2NhL1bmC/jYqqZmBSJYKCy2hxV4Zrm5/c77d8ofaYNBME395kKsOnArKiP54iZK6nI
 5onv4NsGxyocoyEsXRF52Jd4mat3YoRP8r2Mw23wS7wMKG7zvgrQx4T8nh1TnOwJpiqdPBC38Ni
 AMGPBEyq7/rUFQFsWMksSA6QZhVXJ+63QaZUy8tovPgECqa/+yDqLIwnxwWZoG+Cc9h9ibt+UFu
 NnVVbtD6wf94RNxoR2PqwWJY6dfX/d1xfKDtevB3i1AmVwIVarOfKvr+Re9b+rpGhaE7qWCY81z
 XIPRAnURZbxP2Rtwwv38nY+omHimyeN2dcc4CxbQneGZSIsPFSomilx9KjfTppwmF2bmjLNsWcH
 UzfFfgZL4GDaIM+ZAzCzCUk0plf2pK+79SlR6KhxFxA+7P/FhLN1lYwVMsVd73duZ0
X-Received: by 2002:a05:600c:8b53:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-4851989024emr19550785e9.26.1772616636117; 
 Wed, 04 Mar 2026 01:30:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884225asm38972555e9.6.2026.03.04.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:30:35 -0800 (PST)
Date: Wed, 4 Mar 2026 09:30:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: NeilBrown <neilb@ownmail.net>
Cc: "Jeff Layton" <jlayton@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org,
 netfs@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev,
 linux-afs@lists.infradead.org, autofs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org,
 linux-x25@vger.kernel.org, audit@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org,
 linux-sctp@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 000/110] vfs: change inode->i_ino from unsigned long
 to u64
Message-ID: <20260304092559.554ac9a9@pumpkin>
In-Reply-To: <177260561903.7472.14075475865748618717@noble.neil.brown.name>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <1787281.1772535332@warthog.procyon.org.uk>
 <1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
 <177260561903.7472.14075475865748618717@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 89D621FD965
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neilb@ownmail.net,m:jlayton@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:fsverity@lists.linux.dev,m:linux-mm@kvack.org,m:netfs@lists.linux.dev,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-nfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:samba-technical@lists.samba.org,m:linux-nilfs@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-afs@lists.infradead.org,m:autofs@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:codalist@coda.cs.cmu.edu,m:ecryptfs@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:jfs-discussion@lists.sourceforge.net,m:ntfs3@lists.linux.dev,m:ocfs2-devel@lists.linux.dev,m:devel@lists.orangefs.org,m:linux-unionfs@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-security-module@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:selinux@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linar
 o-mm-sig@lists.linaro.org,m:netdev@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fscrypt@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:linux-hams@vger.kernel.org,m:linux-x25@vger.kernel.org,m:audit@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ownmail.net];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ownmail.net:email]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 17:26:59 +1100
NeilBrown <neilb@ownmail.net> wrote:

> On Tue, 03 Mar 2026, Jeff Layton wrote:
> > On Tue, 2026-03-03 at 10:55 +0000, David Howells wrote:  
> > > Jeff Layton <jlayton@kernel.org> wrote:
> > >   
> > > > This version splits the change up to be more bisectable. It first adds a
> > > > new kino_t typedef and a new "PRIino" macro to hold the width specifier
> > > > for format strings. The conversion is done, and then everything is
> > > > changed to remove the new macro and typedef.  
> > > 
> > > Why remove the typedef?  It might be better to keep it.
> > >   
> > 
> > Why? After this change, internel kernel inodes will be u64's -- full
> > stop. I don't see what the macro or typedef will buy us at that point.  
> 
> Implicit documentation?
> ktime_t is (now) always s64, but we still keep the typedef;
> 
> It would be cool if we could teach vsprintf to understand some new
> specifier to mean "kinode_t" or "ktime_t" etc.  But that would trigger
> gcc warnings.

A more interesting one would be something that made gcc re-write the
format with the correct 'length modifier' for the parameter.

That would save a lot of effort!

	David

> 
> NeilBrown
> 

