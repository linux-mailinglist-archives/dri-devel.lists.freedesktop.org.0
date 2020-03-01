Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9875174AF3
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 05:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68E86E0D7;
	Sun,  1 Mar 2020 04:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E9B6E0D7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2020 04:04:33 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C34BE20658;
 Sun,  1 Mar 2020 04:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583035473;
 bh=0JNvEb3Oe9lLFf2wYJ8fkwfOXwpITMyBmYV9rpsUprQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QPAM2InIOtf/BTM0mPFNHD4Eb/MLJlhIH6jVAWt0uUInAhIawWsbRac58Nc+GgYTi
 M9MVw6eqShud7jv5/E1kK+S0i8o9ir9g5e/3olstbMtBoHB1cmp1T7A/b/Zspds5DN
 7TwRnQgkVa5KL9fUgefgyShO2VI5HnyBh2AF2gd8=
Date: Sat, 29 Feb 2020 20:04:32 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= (VMware) <thomas_os@shipmail.org>
Subject: Re: [PATCH v4 0/9] Huge page-table entries for TTM
Message-Id: <20200229200432.55b5b64f46dc2f2f80fa7461@linux-foundation.org>
In-Reply-To: <cc469a2a-e31c-4645-503a-f225fb101899@shipmail.org>
References: <20200220122719.4302-1-thomas_os@shipmail.org>
 <cc469a2a-e31c-4645-503a-f225fb101899@shipmail.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2020 14:08:04 +0100 Thomas Hellstr=F6m (VMware) <thomas_os@s=
hipmail.org> wrote:

> I'm wondering what's the best way here to get the patches touching mm =

> reviewed and accepted?
> While drm people and VMware internal people have looked at them, I think =

> the huge_fault() fallback splitting and the introduction of =

> vma_is_special_huge() needs looking at more thoroughly.
> =

> Apart from that, if possible, I think the best way to merge this series =

> is also through a DRM tree.

Patches 1-3 look OK to me.  I just had a few commenting/changelogging
niggles.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
