Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CrxKbITp2mfdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466AD1F44A3
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307B110E872;
	Tue,  3 Mar 2026 17:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.b="Xjxx8lpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB51210E844
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 16:03:33 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so26411995ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 08:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553813; cv=none;
 d=google.com; s=arc-20240605;
 b=dPSpbFwsV3pbU+yW1tfAV2dQ+BggUGdKLRSA8JIWRe2lte+vd+aPpIo7gKt+869A3z
 w0j9fbaQxF+WstrPz01PKlCLqRe3lxrcGxtYw8A3z85LIVXtdk/Kl55uMipE7e8m2KwT
 whV6w7Y8pTvcIKrzpX1PYDR5qXNn3VDoADNvEJRcnfxwWvgSvV6Kn22eLjxhLNL7GZ3d
 a0Gj6cxq4NS01CdBiywOONF0LjJiwPuEXhks6zpoKkRAB6kv6efIE8e6L8xHqKIs7xgO
 qr8S5yaQChR61GXoBKTk4GakvxyInHu4qz8DZXVa14mwxGSorvz6ecJ44yh3L4jKXiW6
 pOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
 fh=9lUGbi71lH3n8ru9CI94dXDsVNUj9OZqxz7gXHuAjFU=;
 b=bVY2UKRmTvhhEi5+5IAQgJH08HU12kkIYIV7UKq537u3wrrfTQFmGwidnDy7Bm+ui2
 fxQ9tCIbd2v/cRi/7UNZCTBKwlPdkZisqa2DnUJ1Sb1RGnBqqvm7sPLpcx86KoM0KxjI
 xDraVpZkikizwi3A5DVWSHML91R70jH5G6zaB+wW0xvUuTZALqdPJZc79XBOCW2vaUlB
 xFliw5VepMe0EB5TCbUsD4SM/L7t8rokp6cgeWCEBhI5v1WoWu7aTZJARCUqyHe7mes3
 SuRc0onJAP91Y5vLDquEt/JWqAK1A951aCS3KYjx+waUeQgB92kITY6cMlHs2O9s8SJO
 +bzA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1772553813; x=1773158613;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
 b=Xjxx8lpYjLy7FC7cDsI7J1gp0XBEwjGwRuzvhY5RnLZti1p2PgUeJcPztr3A8sJQU8
 L76lYsya3xDxscdRM/R36CFqVGivL63Q3Jsv90WQweml4/XT1smDgqnM3r6nMa3ByJ4C
 NHjPZYfQ7LS7TCjz6OZPbTmCTTOPcgw3dTJount82D66OFFrz1hO/zXgr6vjCUw23Gmq
 byRpCbHP3vvc/pwtZd6jAiXKjzxmYlandt4a5pYLNKJNP14eCP68yEpqFILW8Xa9F47m
 sUg776X8eZFmY6u/ILn7Y9ZPGen4G6hFMu/COT+roQU7AeS//rrFHXNGf+8kADHesYvr
 kAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772553813; x=1773158613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
 b=rx9lHJqUIxVG4FKVBIw97Z1wB2jhZ2gp5Yj1ut+sORhuXnWspXZ6ZVrh6ErzgEzq0H
 TJNx20DBfKnXEAMTfiFEFCTfbEVr8s85oqUtJPfTBjF5K5FhKVkduGON4SU4h8j5IhfW
 YBjxJxyqQC1tZnK//cgaWVv5kfu/blwI6okqN4u1lLy/iu6ou6gTM1AGRGkRbcUuRXtI
 n3cIkWYitXUwvJ0gF1UoCeyfUA6Y2McLxWk67LTofyq+jZdu2Jr+Cm5DJmCTDJJAglqb
 KEpaUFkT7AQYlAFSJnwXo9LTchgPcWROxSA8m0F3zbQp+Ik4CLodWFUFIkRsdzEeB5bY
 CiyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ37er/DcV8QqoxOqcP/vyyo/iSsEEuLaLioaXaIr9EkDd3M7SfRloe+b+TRbP7qf/dcoPCOydTww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTRc+Rp2dvtbaJujcZFKDBSWALoif5PL51R3+LD9wWhZZMZzEG
 EEAFNlRKF8xFqPl7PTgflbmOaNo5iiR9uM3q64tXEodckcBZfGEk919XRKdEvexn9NuoAFzhM4P
 1GPE6z8VuF7BFHYUiHDniVhDHiRAWJP9cNDZoPhsk
X-Gm-Gg: ATEYQzz7VjV8YMqGqY7DtPQ2DoWnrTQbxFgE+1+fXAOJpJX/ewIC2HeBcvHRnkREGna
 56WKeK1ejDthm0rNtQJJc5V+n9MDqcFYyx3aDqx6rM9pz4XDm1+tZikf5aqxpc93gFTwCBdwa/t
 32uJ51w9qCYg7Ji8V12S8WjZQgtkGXz//7dhi+caZBzHR1ibvQU3EEv44DfJxQ/CiHrPoWwqFxV
 bB9zoeUmLZzkf0NFlUvE7Ik7tspM8aMymNgc8rtKCZoAf1nlZpMusyTd5fNAOvGclnCo3HYrbe7
 YqlrKqg=
X-Received: by 2002:a17:902:f60d:b0:2ae:6457:30b4 with SMTP id
 d9443c01a7336-2ae645735cdmr15498765ad.36.1772553812817; Tue, 03 Mar 2026
 08:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-3-e5388800dae0@kernel.org>
 <CAHC9VhRnmBuXEKkUPQhJ_LDzcksjoAJL-ne6mFoJdR1hnDdzsg@mail.gmail.com>
 <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
In-Reply-To: <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Mar 2026 11:03:20 -0500
X-Gm-Features: AaiRm51FwCY5Sd0470l_ykVC0rIb7qnpGdc7B1bNvF1bAK1vXw1y1CZQ64VgwhQ
Message-ID: <CAHC9VhTyhnG7-ojnTnVdh_m1x=rKxw9YEH9g7Xp9m4F78aA5cA@mail.gmail.com>
Subject: Re: [PATCH v2 003/110] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, 
 Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
 Alexander Aring <alex.aring@gmail.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, 
 Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, 
 Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Ilya Dryomov <idryomov@gmail.com>, 
 Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, 
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>,
 Amir Goldstein <amir73il@gmail.com>, 
 Christoph Hellwig <hch@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Yangtao Li <frank.li@vivo.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>,
 Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Xin Long <lucien.xin@gmail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
 fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Mar 2026 17:00:21 +0000
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
X-Rspamd-Queue-Id: 466AD1F44A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[paul-moore.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[paul-moore.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[paul@paul-moore.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net,vger.kernel.org,lists.linux.dev,kvack.org,lists.sourceforge.net,lists.samba.org,lists.infradead.org,coda.cs.cmu.edu,lists.orangefs.org,lists.ubuntu.com,lists.freedesktop.org,lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:willy@infradead.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:dhowells@redhat.com,m:pc@manguebit.org,m:adilger.kernel@dilger.ca,m:jack@suse.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:trondmy@kernel.org,m:anna@kernel.org,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:sfrench@samba.org,m:ronniesahlberg@gmail.com,m:sprasad@microsoft.com,m:bharathsm@microsoft.com,m:alex.aring@gmail.com,m:konishi.ryusuke@gmail.com,m:slava@dubeyko.com,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:dsterba@suse.com,m:marc.dionne@auristor.com,m:raven@themaw.net,m:luisbg@kernel.org,m:salah.triki@gmail.com,m:aivazian.tigran@gmail.com,m:i
 dryomov@gmail.com,m:amarkuze@redhat.com,m:jaharkes@cs.cmu.edu,m:coda@cs.cmu.edu,m:nico@fluxnic.net,m:code@tyhicks.com,m:amir73il@gmail.com,m:hch@infradead.org,m:glaubitz@physik.fu-berlin.de,m:frank.li@vivo.com,m:mikulas@artax.karlin.mff.cuni.cz,m:dwmw2@infradead.org,m:richard@nod.at,m:shaggy@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:miklos@szeredi.hu,m:al@alarsen.net,m:chengzhihao1@huawei.com,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:john.johansen@canonical.com,m:jmorris@namei.org,m:serge@hallyn.com,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:wufan@kernel.org,m:stephen.smalley.work@gmail.com,m:omosnace@redhat.com,m:casey@schaufler-ca.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:edumazet@google.com,
 m:kuniyu@google.com,m:pabeni@redhat.com,m:willemb@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:horms@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[171];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[paul-moore.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 6:05=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wro=
te:
> On Mon, 2026-03-02 at 18:44 -0500, Paul Moore wrote:
> > On Mon, Mar 2, 2026 at 3:25=E2=80=AFPM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > >
> > > inode->i_ino is being widened from unsigned long to u64. The audit
> > > subsystem uses unsigned long ino in struct fields, function parameter=
s,
> > > and local variables that store inode numbers from arbitrary filesyste=
ms.
> > > On 32-bit platforms this truncates inode numbers that exceed 32 bits,
> > > which will cause incorrect audit log entries and broken watch/mark
> > > comparisons.
> > >
> > > Widen all audit ino fields, parameters, and locals to u64, and update
> > > the inode format string from %lu to %llu to match.
> > >
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  include/linux/audit.h   | 2 +-
> > >  kernel/audit.h          | 9 ++++-----
> > >  kernel/audit_fsnotify.c | 4 ++--
> > >  kernel/audit_watch.c    | 8 ++++----
> > >  kernel/auditsc.c        | 2 +-
> > >  5 files changed, 12 insertions(+), 13 deletions(-)
> >
> > We should also update audit_hash_ino() in kernel/audit.h.  It is a
> > *very* basic hash function, so I think leaving the function as-is and
> > just changing the inode parameter from u32 to u64 should be fine.

...

> It doesn't look like changing the argument type will make any material
> difference. Given that it should still work without that change, can we
> leave this cleanup for you to do in a follow-on patchset?

I would prefer if you made the change as part of the patch, mainly to
keep a patch record of this being related.

Ideally I'd really like to see kino_t used in the audit code instead
of u64, but perhaps that is done in a later patch that I didn't see.

--=20
paul-moore.com
