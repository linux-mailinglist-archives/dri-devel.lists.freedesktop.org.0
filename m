Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGAKLmwSnGkY/gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:40:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3107173283
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3710E297;
	Mon, 23 Feb 2026 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F6D10E297
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:40:08 +0000 (UTC)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-66b612efb4aso51781754eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 00:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771836008; x=1772440808;
 h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUp2sLsTQG2be743RxBuEK2iTbA/TXBt6KIKc8LeryU=;
 b=tkrB2YCQOEW1myDWm/xOx1YzF5Eyy0e5WEArIaEDJm9CxwiOZp3DDR8aF0sD7HCED2
 NhwOywxDmmMDSxOiMiovKSZANwtWN/wQXzGXPyqLT0sgbY8DotVnJLlRy2Z/HOmoJAIn
 WeJRVfkc9rq8fJ0+tdOh7vn/wEKRul7nSPdViWlDJdz1NTDX+inmMxBLOj9xSXeiK9Pt
 7SyYWeOhW5CM7D9MnCg1JifLxU5cKfSuH75/ONdLgwFx7K1fR5tKEPRQ41j7MqLf6bBc
 KgPuDzBVOzVhEIrxhsQJ4irhk5gZjulBDu5CNWRAE2w2MQFdE2TeJpkhhvBTNtFQtbJf
 ht5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr/QEz++N5Efd+rgkwwLQLBtICCWYvA3oUnF0g8DhcXPEnycnc5oeTM7JnujNNi9tAwNKLEQSYr5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfcYTbc9uEiZlywJ6KbIkxx2WsSMrfAkz1qv/3El3sTcZ3Nr58
 NFR8Y0r5kic9GvR3BhJOSC0cXB1xyT9rMo8JBJpJxkoLlsa7rnymMK7Af1CGTgKb/cGLQIDRbMO
 IjupmxwZ6maQ2XsnEbJWt6D7hP+wRHAhfCyWeztDvsWGV8XSC4RohOuzv/7M=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:468c:b0:679:c41f:edf with SMTP id
 006d021491bc7-679c41f0fcdmr3630394eaf.29.1771836008198; Mon, 23 Feb 2026
 00:40:08 -0800 (PST)
Date: Mon, 23 Feb 2026 00:40:08 -0800
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <699c1268.050a0220.340abe.0d38.GAE@google.com>
Subject: [syzbot ci] Re: Zero page->private when freeing pages
From: syzbot ci <syzbot+cid1b0d4bbb448f87c@syzkaller.appspotmail.com>
To: airlied@gmail.com, akpm@linux-foundation.org, aliceryhl@google.com, 
 arve@android.com, axboe@kernel.dk, baohua@kernel.org, 
 baolin.wang@linux.alibaba.com, brauner@kernel.org, christian.koenig@amd.com, 
 cl@gentwo.org, cmllamas@google.com, dave@stgolabs.net, david@kernel.org, 
 dennis@kernel.org, dev.jain@arm.com, dhavale@google.com, dlemoal@kernel.org, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 guochunhai@vivo.com, hannes@cmpxchg.org, harry.yoo@oracle.com, 
 jackmanb@google.com, jefflexu@linux.alibaba.com, johannes.thumshirn@wdc.com, 
 katrinzhou@tencent.com, kernelxing@tencent.com, kprateek.nayak@amd.com, 
 lance.yang@linux.dev, liam.howlett@oracle.com, lihongbo22@huawei.com, 
 linux-block@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, 
 matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
 mripard@kernel.org, npache@redhat.com, ray.huang@amd.com, rientjes@google.com, 
 roman.gushchin@linux.dev, ryan.roberts@arm.com, sandeen@redhat.com, 
 simona@ffwll.ch, surenb@google.com, tj@kernel.org, tkjos@android.com, 
 tzimmermann@suse.de, vbabka@kernel.org, xiang@kernel.org, zbestahu@gmail.com, 
 ziy@nvidia.com
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
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
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:akpm@linux-foundation.org,m:aliceryhl@google.com,m:arve@android.com,m:axboe@kernel.dk,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:brauner@kernel.org,m:christian.koenig@amd.com,m:cl@gentwo.org,m:cmllamas@google.com,m:dave@stgolabs.net,m:david@kernel.org,m:dennis@kernel.org,m:dev.jain@arm.com,m:dhavale@google.com,m:dlemoal@kernel.org,m:gregkh@linuxfoundation.org,m:guochunhai@vivo.com,m:hannes@cmpxchg.org,m:harry.yoo@oracle.com,m:jackmanb@google.com,m:jefflexu@linux.alibaba.com,m:johannes.thumshirn@wdc.com,m:katrinzhou@tencent.com,m:kernelxing@tencent.com,m:kprateek.nayak@amd.com,m:lance.yang@linux.dev,m:liam.howlett@oracle.com,m:lihongbo22@huawei.com,m:linux-block@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:maarten.lankhorst@linux.intel.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:mripard@kerne
 l.org,m:npache@redhat.com,m:ray.huang@amd.com,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:ryan.roberts@arm.com,m:sandeen@redhat.com,m:simona@ffwll.ch,m:surenb@google.com,m:tj@kernel.org,m:tkjos@android.com,m:tzimmermann@suse.de,m:vbabka@kernel.org,m:xiang@kernel.org,m:zbestahu@gmail.com,m:ziy@nvidia.com,m:syzbot@lists.linux.dev,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,google.com,android.com,kernel.dk,kernel.org,linux.alibaba.com,amd.com,gentwo.org,stgolabs.net,arm.com,lists.freedesktop.org,linuxfoundation.org,vivo.com,cmpxchg.org,oracle.com,wdc.com,tencent.com,linux.dev,huawei.com,vger.kernel.org,lists.ozlabs.org,kvack.org,linux.intel.com,intel.com,suse.com,redhat.com,ffwll.ch,suse.de,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[cid1b0d4bbb448f87c];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,googlesource.com:url]
X-Rspamd-Queue-Id: E3107173283
X-Rspamd-Action: no action

syzbot ci has tested the following series

[v1] Zero page->private when freeing pages
https://lore.kernel.org/all/20260223032641.1859381-1-ziy@nvidia.com
* [PATCH v1 01/11] relay: zero page->private when freeing pages
* [PATCH v1 02/11] mm/slub: zero page->private when freeing pages
* [PATCH v1 03/11] drm/ttm: zero page->private when freeing pages
* [PATCH v1 04/11] blk-mq: zero page->private when freeing pages
* [PATCH v1 05/11] watch_queue: zero page->private when freeing pages
* [PATCH v1 06/11] binder: zero page->private when freeing pages
* [PATCH v1 07/11] null_blk: zero page->private when freeing pages
* [PATCH v1 08/11] percpu: zero page->private when freeing pages
* [PATCH v1 09/11] erofs: zero page->private when freeing pages
* [PATCH v1 10/11] mm/huge_memory: add page->private check back in __split_folio_to_order()
* [PATCH v1 11/11] mm/page_alloc: check page->private upon page free

and found the following issue:
WARNING in __free_frozen_pages

Full report is available here:
https://ci.syzbot.org/series/10f470ac-46ac-4e38-902d-dc86ae743494

***

WARNING in __free_frozen_pages

tree:      mm-new
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/akpm/mm.git
base:      a6fdc327de4678e54b5122441c970371014117b0
arch:      amd64
compiler:  Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
config:    https://ci.syzbot.org/builds/0586347c-8ef1-427f-8a9c-7f6c08b616a9/config

Bluetooth: RFCOMM ver 1.11
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
Bluetooth: BNEP socket layer initialized
Bluetooth: HIDP (Human Interface Emulation) ver 1.2
Bluetooth: HIDP socket layer initialized
NET: Registered PF_RXRPC protocol family
Key type rxrpc registered
Key type rxrpc_s registered
NET: Registered PF_KCM protocol family
lec:lane_module_init: lec.c: initialized
mpoa:atm_mpoa_init: mpc.c: initialized
l2tp_core: L2TP core driver, V2.0
l2tp_ppp: PPPoL2TP kernel driver, V2.0
l2tp_ip: L2TP IP encapsulation support (L2TPv3)
l2tp_netlink: L2TP netlink interface
l2tp_eth: L2TP ethernet pseudowire support (L2TPv3)
l2tp_ip6: L2TP IP encapsulation support for IPv6 (L2TPv3)
NET: Registered PF_PHONET protocol family
8021q: 802.1Q VLAN Support v1.8
sctp: Hash tables configured (bind 32/56)
NET: Registered PF_RDS protocol family
Registered RDS/infiniband transport
Registered RDS/tcp transport
tipc: Activated (version 2.0.0)
NET: Registered PF_TIPC protocol family
tipc: Started in single node mode
smc: adding smcd device lo without pnetid
NET: Registered PF_SMC protocol family
9pnet: Installing 9P2000 support
NET: Registered PF_CAIF protocol family
NET: Registered PF_IEEE802154 protocol family
Key type dns_resolver registered
Key type ceph registered
libceph: loaded (mon/osd proto 15/24)
batman_adv: B.A.T.M.A.N. advanced 2025.5 (compatibility version 15) loaded
openvswitch: Open vSwitch switching datapath
NET: Registered PF_VSOCK protocol family
mpls_gso: MPLS GSO support
IPI shorthand broadcast: enabled
sched_clock: Marking stable (19970046340, 93374727)->(20073238384, -9817317)
registered taskstats version 1
Loading compiled-in X.509 certificates
Loaded X.509 cert 'Build time autogenerated kernel key: 98092a222e11368da223b039d625e21c3e2e069c'
zswap: loaded using pool 842
Demotion targets for Node 0: null
Demotion targets for Node 1: null
debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
------------[ cut here ]------------
page->private
WARNING: mm/page_alloc.c:1433 at __free_frozen_pages+0x78e/0xe10, CPU#0: swapper/0/1
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:__free_frozen_pages+0x78e/0xe10
Code: 5f 5d e9 05 1e 00 00 48 b8 00 00 00 00 00 fc ff df 0f b6 44 05 00 84 c0 0f 85 d7 02 00 00 c7 03 ff ff ff ff e9 22 fc ff ff 90 <0f> 0b 90 e9 8d fc ff ff bd 01 00 00 00 83 f8 05 0f 85 bb fe ff ff
RSP: 0000:ffffc900000676e0 EFLAGS: 00010282
RAX: 1ffffd4000bad935 RBX: ffffea0005d6c9a8 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffea0005d6c9b4
RBP: ffffea0005d6c9b8 R08: ffffea0005d6c9b7 R09: 1ffffd4000bad936
R10: dffffc0000000000 R11: fffff94000bad937 R12: ffffea0005d6c980
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88818de64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000e54c000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 destroy_args+0x15d/0x570
 debug_vm_pgtable+0x3f8/0x410
 do_one_initcall+0x250/0x8d0
 do_initcall_level+0x104/0x190
 do_initcalls+0x59/0xa0
 kernel_init_freeable+0x2a6/0x3e0
 kernel_init+0x1d/0x1d0
 ret_from_fork+0x51e/0xb90
 ret_from_fork_asm+0x1a/0x30
 </TASK>


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.
