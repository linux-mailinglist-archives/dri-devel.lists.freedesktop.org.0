Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPWtNT4fhmm/JwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:05:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA09100B6D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8433A10E840;
	Fri,  6 Feb 2026 17:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="c0m+A8Cb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dogZ3on";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c0m+A8Cb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dogZ3on";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC52E10E842
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 17:04:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F01B5BCC5;
 Fri,  6 Feb 2026 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770397495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3g+CeqAHKY80QYlzK7Q90kGJJbcwGzuOMv3DI6coiUI=;
 b=c0m+A8Cbf+rLZ3szeGwqR0keK2N4x1OkUaeOPTkf3sMJNCpTeUBur5IDP+DKAQ2eQgejrS
 zIEXRT0ObUT+WOhQz/vocMcAjoOtK+Zb3qEnwu8Gthjmkgjq2Xsl8B20qlBNlf2GpU40xr
 mQI9AS7BtgLrI9P4+fMTgCEFkGS9Q6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770397495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3g+CeqAHKY80QYlzK7Q90kGJJbcwGzuOMv3DI6coiUI=;
 b=9dogZ3on7nsX+Y0Jpn32RxODAdydoZXUQ8/EzP5Y+0myTaTkASY5FCgVI2NW4EsJx7Wp53
 E9r9FSnoaQE1aJBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770397495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3g+CeqAHKY80QYlzK7Q90kGJJbcwGzuOMv3DI6coiUI=;
 b=c0m+A8Cbf+rLZ3szeGwqR0keK2N4x1OkUaeOPTkf3sMJNCpTeUBur5IDP+DKAQ2eQgejrS
 zIEXRT0ObUT+WOhQz/vocMcAjoOtK+Zb3qEnwu8Gthjmkgjq2Xsl8B20qlBNlf2GpU40xr
 mQI9AS7BtgLrI9P4+fMTgCEFkGS9Q6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770397495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3g+CeqAHKY80QYlzK7Q90kGJJbcwGzuOMv3DI6coiUI=;
 b=9dogZ3on7nsX+Y0Jpn32RxODAdydoZXUQ8/EzP5Y+0myTaTkASY5FCgVI2NW4EsJx7Wp53
 E9r9FSnoaQE1aJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 517453EA63;
 Fri,  6 Feb 2026 17:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cV+8EDIfhml0FwAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Fri, 06 Feb 2026 17:04:50 +0000
Date: Fri, 6 Feb 2026 17:04:44 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
 Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
 Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Tony Luck <tony.luck@intel.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>,
 James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
 Carlos Maiolino <cem@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Jann Horn <jannh@google.com>, 
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
 Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-sgx@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
 linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev, 
 devel@lists.orangefs.org, linux-xfs@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 02/13] mm: rename vma_flag_test/set_atomic() to
 vma_test/set_atomic_flag()
Message-ID: <5pqsv3quguk6mwxywdqpvkcxhmqjoupqq44pserucrlelnyvnc@tkwpixdhcw5i>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
 <033dcf12e819dee5064582bced9b12ea346d1607.1769097829.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <033dcf12e819dee5064582bced9b12ea346d1607.1769097829.git.lorenzo.stoakes@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dan.j.williams@intel.com,m:vishal.l.verma@intel.com,m:dave.jiang@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:bcrl@kvack.org,m:xiang@kernel.org,m:chao@kernel.org,m:zbestahu@gmail.com,m:jefflexu@linux.alibaba.com,m:dhavale@google.com,m:lihongbo22@huawei.com,m:guochunhai@vivo.com,m:tytso@mit.edu,m:adilger.kernel@dilger.ca,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kern
 el.org,m:almaz.alexandrovich@paragon-software.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:babu.moger@amd.com,m:cem@kernel.org,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:willy@infradead.org,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:ziy@nvidia.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:jannh@google.com,m:dhowells@redhat.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-sgx@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-cxl@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:li
 nux-mm@kvack.org,m:ntfs3@lists.linux.dev,m:devel@lists.orangefs.org,m:linux-xfs@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:jgg@nvidia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,oracle.com,suse.com,nvidia.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[93];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,suse.de:dkim]
X-Rspamd-Queue-Id: EEA09100B6D
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 04:06:11PM +0000, Lorenzo Stoakes wrote:
> In order to stay consistent between functions which manipulate a vm_flags_t
> argument of the form of vma_flags_...() and those which manipulate a
> VMA (in this case the flags field of a VMA), rename
> vma_flag_[test/set]_atomic() to vma_[test/set]_atomic_flag().
> 
> This lays the groundwork for adding VMA flag manipulation functions in a
> subsequent commit.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
