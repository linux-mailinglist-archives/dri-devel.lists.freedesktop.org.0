Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB519FF04
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 22:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92FD6E4C5;
	Mon,  6 Apr 2020 20:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DBD6E4C5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A8CC343DF6;
 Mon,  6 Apr 2020 22:26:02 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=j4IsSgXC; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SIvHs6jCMD6; Mon,  6 Apr 2020 22:26:01 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id AEB7B43DF7;
 Mon,  6 Apr 2020 22:25:53 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 00151360153;
 Mon,  6 Apr 2020 22:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586204753; bh=WbUdhT5dg8z6hiyUYRS2nHJSvQqFxrl6lLG86/Mrvrw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=j4IsSgXCnt5Bt0aXP9MiHm1kUCfwxku/J/HE5dUuMTKMOEMowSsbZEHrWcuUNN0yH
 WDg9Fkb77WT1LTTjQ+N2NawXF8q8m2i5RnfAxXl442JoAsMc1xjDwrnanD0DAp+Sbo
 SoUUE3bwPLSNgtYb+QJg2M+7TmotgzrwwCvNB0jk=
Subject: Re: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1586138158.v5u7myprlp.none.ref@localhost>
 <1586138158.v5u7myprlp.none@localhost>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <249c73d2-991a-56b0-53b5-677e9ca54aae@shipmail.org>
Date: Mon, 6 Apr 2020 22:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1586138158.v5u7myprlp.none@localhost>
Content-Language: en-US
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
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/20 9:51 PM, Alex Xu (Hello71) wrote:
> Using 314b658 with amdgpu, starting sway and firefox causes "BUG: Bad
> rss-counter state" and "BUG: non-zero pgtables_bytes on freeing mm" to
> start filling dmesg, and then closing programs causes more BUGs and
> hangs, and then everything grinds to a halt (can't start more programs,
> can't even reboot through systemd).
>
> Using master and reverting that branch up to that point fixes the
> problem.
>
> I'm using a Ryzen 1600 and AMD Radeon RX 480 on an ASRock B450 Pro4
> board with IOMMU enabled.

Hmm. That sounds bad. Could you send a copy of your config?

Meanwhile, I'll prepare a small patch that disables the non-vmwgfx 
huge_fault() until we've figured out what's happening.

/Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
