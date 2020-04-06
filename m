Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206851A08FE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018EB6E5B0;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09889B33
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1586202691; bh=AAubdb+tNTjPwoyqCH1GA4q2yTejWcK2E7tiZaIw2gM=;
 h=Date:From:Subject:To:Cc:References:From:Subject;
 b=rBOEklnQwk6BbVKJ8OnZvewaYukWWNVxzB9UCG9OYxKitP/ELpZQXN5FGjzHFb8y7sMS29jZZwvoIZa3iYpGxFWEJjLl7FdmYdHeyUBYDwVfHXdgu/vv0Yj8FmXKPgM6PI3+W9V3/Gb/0n88zyIzNT94WgOn3vnySG5lTDC7Mlg1Nam1eVX3Xqlm2oOqXOQH0EXshvqTib4CUX1Zr9bD5CGKwr3iiVkJ2sZp3sJP4NM0U5EEBetp7iOj8jPhFk0Tb4b//JXRtd8vTFCzO+1cZTqYuc8yhb20bUXv/YdOew0TJ3ikouV/D1Kp0IFx45OQWE0+r7sAGufenOdygrYYkw==
X-YMail-OSG: sqDwaY0VM1lQsyhhQWTp1ASOAFZhscuAOZaJTjX1KabUoX45MRikl3Yl1DXC85t
 nDX0uI00pziii9pvBCitQo69UOVYYTBu4VTXmEQ2NzFe6SQGn.qLuXzdPCY2n8VMkIY2XMLGNg1O
 zQtGi14sSHGWzLdz5z5X9.yB5.0jrT0SKc9DOLepsaz3fG3XbEe4Tp7FAiuS8o4BcOMZVCve7W5r
 er5Cy5F6RBRSB8.0Vff2uKWpId4zLRu7z8FxBQL8K3jBk3udox.GJFYjJm4Eyu.8ZVDntAx2hGyf
 ojNiIPJVrDKXHb_XTXKVNrqVPIo2pG.9XryxJzIFfPei8pO4OKgQke8Lbe5rHN2XUGDSq6hcIcug
 zwSSYrvJ1GIxZYBruXVffZxqgo8c9LAyk1rTHtS.IBSENUXlOjiktgSNODSCuHtI_IvG9XaBj8MH
 _f9fPW2jTtqdnZOvtbS3mqvKDWHUsY_vhxTCDFcuLRRenTS3HJqGUPAvllbL3CQFedvjeEzYd1ea
 50EBh8CU5Ookn6bC7S5E3juHEKHMLH52Tp0NY9z.BBOF3aVJOUcJwshVVc_7wZuSdCowxrVX_diw
 dmu4C8jFFx3BivLQo9EcgN4usIjHidufs9uyH1bqKD_8nNQCD9uAxH.KUJnH6c1N4EC7PW7BmplH
 i_tBfCUfmwz8P9KzhJh0FHCjIknUUovsBePLwdChUrYk2rcMinOQlvqykfVuyHTRvB5d._6HX4Sk
 r2fKUJAVsFo1svmdinTSoEOEsbdjnVrEi4s067zsrvb4kt5LHLxzl_DSFLyOjvVdu4gKwRN3odP8
 X2zj_e6KWcurMnlO21FkbnsFDLEF4RIkz1vseMSvhqT7DIze1bH9q3IDLf.9CrQD7GMdyAEAXuAs
 Uuam_X6XRbAGZmniSri251fNyl_PdS5NsUsOLX3E4XII6GPlPijzB.Q0fRzfi85qwj39LgvofgZu
 rbNR0upAqMtA7TzN0I0W.M7iFJBydd9hwxETEGPo6IBc6wIskr7uj3XLD1d2VZ4QFSR7Y9xPBp6r
 D2QCrqNfMzzMdF48FAeaaWNWLJfchzhcPxYDpdCypOIl.cS_87WRP6lzoOH6aaSirVFzd5ENwjnQ
 TyeE5jIQb7KWEsvn0J0btX96bJJxBY2QxnaxGeHul1jvgNx_brWYlwiaH0klFZi5._C9.1lNB7zv
 OZ.8MSCmq9jmJnecYmVb9Kvk5LQFdVQqtwg2J8ihjEcGCRYeGwsZkknp4btZr11RWTRXWt.By3tN
 4rNSa8Xxf4WxbcAq9ydIKfENLk7T9rBy4zp7v2kOktFa177mwKWpx7GTQZlelRZEAJbBQx4lgBMB
 uqgcwMl1w4UBl05xopnzmkX1GgvnQKE814PcPc92BhG529SB67KveMIWSodzVpqfocbveZR8vg6s
 Ja4.6x5tFEA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Mon, 6 Apr 2020 19:51:31 +0000
Received: by smtp408.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 564a13dce9f8757db0d103665696d9f0; 
 Mon, 06 Apr 2020 19:51:26 +0000 (UTC)
Date: Mon, 06 Apr 2020 15:51:22 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thomas_os@shipmail.org
MIME-Version: 1.0
Message-Id: <1586138158.v5u7myprlp.none@localhost>
References: <1586138158.v5u7myprlp.none.ref@localhost>
X-Mailer: WebService/1.1.15620 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
 =?iso-8859-1?b?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using 314b658 with amdgpu, starting sway and firefox causes "BUG: Bad 
rss-counter state" and "BUG: non-zero pgtables_bytes on freeing mm" to 
start filling dmesg, and then closing programs causes more BUGs and 
hangs, and then everything grinds to a halt (can't start more programs, 
can't even reboot through systemd).

Using master and reverting that branch up to that point fixes the 
problem.

I'm using a Ryzen 1600 and AMD Radeon RX 480 on an ASRock B450 Pro4 
board with IOMMU enabled.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
