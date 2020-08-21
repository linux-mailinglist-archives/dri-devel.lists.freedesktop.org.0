Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3224E685
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344056E444;
	Sat, 22 Aug 2020 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7836EAA1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:45:51 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200821074549epoutp02c2a51feb1f83af14e0e7406aa4cd5024~tONlyFQ5R0718707187epoutp02m
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:45:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200821074549epoutp02c2a51feb1f83af14e0e7406aa4cd5024~tONlyFQ5R0718707187epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597995949;
 bh=2+53xcHFCjgELMf4X3YPM+muDniBJtUmbh8iQTB7pl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jrAahD8wjWkV/l8lbdx7XgvoVowvobpPBGW1+Q4RX9cLnE+sSHye1jq1ijRPy+eZx
 dVxvGIYJSrZP4O0uFCt2Isx9Lv4cnEN07sR1ue8SgkES+KGO8LdNgBVl1ZdAoBiHoG
 4sr8gzfFoUYI0u0QiMg1NNNdZ39HZDZlSLppforw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200821074548epcas2p1327d7d86f491d1e27975c1242758a78b~tONlDT0C83190931909epcas2p1L;
 Fri, 21 Aug 2020 07:45:48 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.191]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BXtqG3P8PzMqYm0; Fri, 21 Aug
 2020 07:45:46 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 2F.06.19322.9AB7F3F5; Fri, 21 Aug 2020 16:45:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200821074545epcas2p23109c52bfe76a58b26ba1f509cb86165~tONhu-RjS0792807928epcas2p2h;
 Fri, 21 Aug 2020 07:45:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200821074544epsmtrp13b02268595ebe56c8b2715fd355c1038~tONht6LLR0929109291epsmtrp1V;
 Fri, 21 Aug 2020 07:45:44 +0000 (GMT)
X-AuditID: b6c32a45-797ff70000004b7a-00-5f3f7ba969a2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C3.B5.08382.8AB7F3F5; Fri, 21 Aug 2020 16:45:44 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200821074544epsmtip1e7d25fed313408de35eeeb6dd2b14396~tONheg87B0588805888epsmtip1C;
 Fri, 21 Aug 2020 07:45:44 +0000 (GMT)
Date: Fri, 21 Aug 2020 16:38:13 +0900
From: Cho KyongHo <pullip.cho@samsung.com>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
Message-ID: <20200821073813.GA190335@KEI>
MIME-Version: 1.0
In-Reply-To: <20200819132204.2rki3xsczdy2cpsk@DESKTOP-E1NTVVP.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTfd9veXsgqlwL6haFiJ1sg41FY4UOEgYq529SxLO6VzdLADRBL
 aXqpGzgzZPKWIgI63jU8lAKDIAqjAqEwHh0qQQREGBE2DYTHAshgBreWCwn//c45v9/3+845
 OQRHWMy3J6IUsbRKIZOLcEvu3U5n5Fp1/gOph67FCS0as/moqK4GR4kGI46mjAMAzU/qeai0
 6wEPDb1cxNFG2gAPVWX8hKN/tFMc1P/KFVXdW8PQytAzDD1qKcLR5fo7PPRHzX88VNA3jKHK
 l4t81H/zMgcltXbxkXFimY9yBrU4KryoAYF7qKTBDZyqKakB1CNNJkZpG9RUgy4NpxqWrvKp
 9PkhjBofvodTvT+/4lKTGT0Y9fT1NIdabHuMU5pGHaD6tV18qme0CaOWG/aFkF/LD0fSsnBa
 5UgrwmLCoxQR/qKPP5MelUq8PcSuYl/kI3JUyKJpf9GxEyGux6PkplmIHM/J5GpTKkTGMCL3
 gMOqGHUs7RgZw8T6i2hluFwpFivdGFk0o1ZEuIXFRB8Se3h4SkzMUHlk6ugGX7kk/P7WUgU3
 ATRZpQMLApLvwycvyrB0YEkIyWYAE/Pb+GywBGBt329bwSqAo0n/gm2JRn97q9AK4HxzCZcN
 ngFYfv8az8zikk6wvGQVN2OcdIHVxT0mNUHYks7wYpHUzOeQxVw4l5KxybEhfWCnLpVr5ghM
 nF8mBea0gLSGffl/cs3YgvwI6q9l4WaKHXkQznb8aH4Gku0WMDtnjcN+7hgcbqvlsdgGzvY0
 8llsD2eykvms4DqAC6UGnC3cBnBVb81iL1jwPGWzSw4ZCbsHczCzGSTfhl1jXDa9C6Z2bvDZ
 tACmJgtZ5UH4a94wd9tK0zq6hSlYcVfDY8dTg8FLZXO8K2B/wY7WCna4sfg9qNUv4QUmCw75
 Frz5mmChM6xrcdcCng7sppVMdATNeCrFO5fdADbvxCW4GeTM/+1mABgBDAASHJGtILPVTyoU
 hMvi4mlVjFSlltOMAUhMa8rm2NuFxZgOTRErFUs8vb09fCVI4u2JRHsE0QcGzgjJCFksfZam
 lbRqW4cRFvYJWJ5dn/xAfmZ9deu3Q76rhu96ix6c2js/E7kiCArYP/fGobjizwPWT/nnVXBp
 m6npvybL1CXBtX0CqxMOT9sCx9Mmc72CA6Fi+ozFw/Pvjlc16Y8Y1erO5+33dYMLdz4sP854
 iQNz176qS5OIT3a0/x5lXbnmfiGv4MuxNxPDP/U/qRvsz9/tGecX7l8/rVlxPXphtvt0B1E6
 F+qdLG3IbbKta6zMtpy4cmu50GNkvXfi9NQnX8zoQquXnfo6LPbm3HhYHyrzexG/z2FlrOwq
 HmQsW11/pzqeWJgK9u52OCdIuEGctWJw3ohGaW/zjadPzUjKrowsovDxDzmW80F65lLIkyMi
 LhMpE7twVIzsf1gBG/OwBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzHfZ/nued5OjseyfqqiZ7F1Cpuk75+xabNwzSxWTujc6tHP9xV
 7oRiU9GorqSUOidno3Idcghd2F1HOs2sYrf8OPnValqUKKn01Iz/Xnt/Xu/3Xx8ad39HeNEJ
 Sft5dZJCyZJioq6R9QmqPrxWvvRh9nLU5zhNIf11E4mybA4SvXc8B6jXZRGhC/ZnItQ+2Eei
 0ZznInQl7xiJfhre46hlJAhdaRjC0Pf2Tgy11etJpK29LUJvTeMipGt+iaHKwT4KtVRpcZR9
 304hx5sBChW3Gkh0LrMArPPksltHSc5UYQJcW0E+xhnMqZzZmENy5v4iisvtbce41y8bSO5J
 2QjBufKaMO7V2Aec63vwguQKbhkB12KwU1yT8w7GDZh9Ipkd4tWxvDLhAK9eErZbHN/s+Iml
 mJlDbZmfyQxQKMkFbjRklsECy01KYHfGAmDzucip3AtW5F3Fpng2dB23i3KBeMJxAfijtgMX
 DgSzEF6q+EEKTDIBsOZ8E8gFNO3B+MNMvVzwceYiAV/oKied2UwobDSeJARHMuFcc0mmNk0Y
 7LpUM7kpYWbB5vKPhMD4xKZzrBsTfJzxhlVjtBC7MZugpfQUKcRzGD/YYz1aCGbp/ivr/ivr
 /pUNADeCuXyKRhWn0khTpEn8wWCNQqVJTYoLjklWmcHkEwT43wV3jF+DbQCjgQ1AGmc9JPn3
 V8ndJbGKtHRenSxXpyp5jQ140wTrKXHuuxjtzsQp9vN7eT6FV/+9YrSbVwZWFvj4fPL23vBR
 W9uDs7Kz25nH+W+2he/qt2rWKRuz6o64pCt03e07V/scKg9B+YG1T7Xf/EJkUcOvzevrq0+Y
 ykN9LUGlK6OKD6RFlLutvVd1kx3uN12IXhzztORGooQdkKVGjBTN1cqjcuxWQ7f/2y+JnmHK
 kMxf4RtfZS1QyddE1E3TF40n7OmZFk/clc0s+VQzf1mOWDTjcuSQXGtM5zNOKaS+Z8KcyfhY
 ybZs+CiveOvp6MSunobWWKMqyC9t6cnxORmbNwR0BCr1gfX70tlha2EXvjg6y8s3Zjp10KPT
 uah6xWDHFkoWgd36tL6ya2D8UdmCnpn4PMPVYiv7myU08QppAK7WKP4A2KcPc3MDAAA=
X-CMS-MailID: 20200821074545epcas2p23109c52bfe76a58b26ba1f509cb86165
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4f1bd_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
 <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <20200818105557.svky5c7gdvk6khzu@DESKTOP-E1NTVVP.localdomain>
 <20200819034626.GB70898@KEI>
 <20200819132204.2rki3xsczdy2cpsk@DESKTOP-E1NTVVP.localdomain>
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, labbott@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, nd@arm.com,
 surenb@google.com, akpm@linux-foundation.org, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 minchan@kernel.org, joaodias@google.com, iamjoonsoo.kim@lge.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4f1bd_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Brain,

On Wed, Aug 19, 2020 at 02:22:04PM +0100, Brian Starkey wrote:
> Hi KyongHo,
> 
> On Wed, Aug 19, 2020 at 12:46:26PM +0900, Cho KyongHo wrote:
> > I have seriously considered CPA in our product but we developed our own
> > because of the pool in CPA.
> 
> Oh good, I'm glad you considered it :-)
> 
> > The high-order pages are required by some specific users like Netflix
> > app. Moreover required number of bytes are dramatically increasing
> > because of high resolution videos and displays in these days.
> > 
> > Gathering lots of free high-order pages in the background during
> > run-time means reserving that amount of pages from the entier available
> > system memory. Moreover the gathered pages are soon reclaimed whenever
> > the system is sufferring from memory pressure (i.e. camera recording,
> > heavy games).
> 
> Aren't these two things in contradiction? If they're easily reclaimed
> then they aren't "reserved" in any detrimental way. And if you don't
> want them to be reclaimed, then you need them to be reserved...
> 
> The approach you have here assigns the chunk of memory as a reserved
> CMA region which the kernel is going to try not to use too - similar
> to the CPA pool.
> 
> I suppose it's a balance depending on how much you're willing to wait
> for migration on the allocation path. CPA has the potential to get you
> faster allocations, but the downside is you need to make it a little
> more "greedy".
> 
I understand why you think it as contradiction. But I don't think so.
Kernel page allocator now prefers free pages in CMA when allocating
movable pages by commit
https://lore.kernel.org/linux-mm/CAAmzW4P6+3O_RLvgy_QOKD4iXw+Hk3HE7Toc4Ky7kvQbCozCeA@mail.gmail.com/
.

We are trying to reduce unused pages to improve performance. So, unused
pages in a pool should be easily reclaimed. That is why we does not
secure free pages in a special pool for a specific usecase. Instead we
have tried to reduce performance bottle-necks in page migration to
allocate large amount memory when the memory is needed.

------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4f1bd_
Content-Type: text/plain; charset="utf-8"


------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4f1bd_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

------lWUYs60uNheWdrlwd5Sxb-jVEnyT8vPvqGqUNsoxLEsY2Otg=_4f1bd_--
