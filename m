Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50A1DE04C
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A756E97C;
	Fri, 22 May 2020 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C7B6E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 14:17:35 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200521141733epoutp011e338e69aa54559a3e8d1b4e297e5056~RENWsxQrY0683806838epoutp01i
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 14:17:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200521141733epoutp011e338e69aa54559a3e8d1b4e297e5056~RENWsxQrY0683806838epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590070653;
 bh=yaoOLNL/YwnMgUGKxYrh4eIUsX8d53qGNJ5vpxP3jDg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=laAjjfYjT+Fl7JL9KEbQGkSuVgsDBtfsW3TjofdC8xxuHghczHhVhHEC3lF9xg2iL
 bhBQFrdleGbJXNchbhwaPOLDnOEVBd5t+/7UfTjugChEpzBT/i8aqOIMF0uTX5YOXm
 jw3VFfGKm2X5K7cbWjuLFG6xPNtCCL1KclPUVLeM=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20200521141733epcas5p29db77a3345a33b9bfef5a9b128af6022~RENWbjCbd3018830188epcas5p2q;
 Thu, 21 May 2020 14:17:33 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C4.80.23389.C7D86CE5; Thu, 21 May 2020 23:17:32 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20200521141731epcas5p3970e37a1b1b1986b75814de104e4a857~RENVbBznh1164911649epcas5p38;
 Thu, 21 May 2020 14:17:31 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200521141731epsmtrp1b904e2decbc2efb1412f81159a003615~RENVZ1AuM1587215872epsmtrp1b;
 Thu, 21 May 2020 14:17:31 +0000 (GMT)
X-AuditID: b6c32a4b-797ff70000005b5d-6a-5ec68d7c6ce6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E8.BB.18461.B7D86CE5; Thu, 21 May 2020 23:17:31 +0900 (KST)
Received: from mshams01 (unknown [107.122.43.244]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200521141728epsmtip2175afe050debcb26c6df5c9eee7767df~RENR51xpw0089300893epsmtip2d;
 Thu, 21 May 2020 14:17:27 +0000 (GMT)
From: "M Tamseel Shams" <m.shams@samsung.com>
To: "'Inki Dae'" <inki.dae@samsung.com>, <jy0922.shim@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
In-Reply-To: <fa372f07-abba-a296-c315-e9769fb43623@samsung.com>
Subject: RE: [PATCH v2] drm/exynos: Remove dev_err() on platform_get_irq()
 failure
Date: Thu, 21 May 2020 19:47:25 +0530
Message-ID: <000001d62f7a$90a004d0$b1e00e70$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7RT4aJkRNX9fY1F1/HBHlZPyRGwGjzbRFAXV3RIKoT5+4wA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGKsWRmVeSWpSXmKPExsWy7bCmlm5t77E4g09iFr3nTjJZPJi3jc3i
 /7aJzBZXvr5ns5h0fwKLxYt7F1kszp/fwG5xtukNu8Wmx9dYLS7vmsNmMeP8PiaLIw93s1vM
 mPySzYHXY++3BSwem1Z1snls//aA1eN+93Emj81L6j36tqxi9Pi8SS6APYrLJiU1J7MstUjf
 LoErY8XhXsaC7ewVG5YvZmlgXMLWxcjBISFgInF+p1wXIxeHkMBuRonbM9+yQzifGCWm971h
 hXC+MUo8mvKYuYuRE6zj25lfbBCJvYwSTZ82QFU9Z5S4sPYrC0gVm4CuxKSDbcwgCRGBJYwS
 f9f+YAJxmAUeMkp0rJwLNotTwF7i0v57rCC2sECIRMu3D2BxFgFViavXF4FdyCtgKXGvIQYk
 zCsgKHFy5hOwBcwC2hLLFr6GOklB4ufTZWBjRAScJG49fM8MUSMu8fLoEbCHJASucEhMn/mB
 FaLBRWL+rD4WCFtY4tXxLewQtpTEy/42KDtfYv68VVALKiRWXngDZdtLHLgyhwXkNmYBTYn1
 u/QhdvFJ9P5+wgQJVF6JjjYhiGpFif+7+6Emiku8WzEF6gIPia+3l7FNYFScheSzWUg+m4Xk
 g1kIyxYwsqxilEwtKM5NTy02LTDOSy3XK07MLS7NS9dLzs/dxAhOalreOxgfPfigd4iRiYPx
 EKMEB7OSCO9C/qNxQrwpiZVVqUX58UWlOanFhxilOViUxHkfN26JExJITyxJzU5NLUgtgsky
 cXBKNTBtVVlo80OHYYrT1+gpbc9frP6kldQgIaRddzg+eeefg72VLxdWxQZr8dlx6zwXv6r0
 +cqLmEJbm0Va017UhHiyXOZV7e9o8i3gTS6exfHk3iXnn79lPkj5TQx8fUNwx5qK93HzXnQG
 zU848/GPyMEC25QO1p/B6/dE2VWfyufWKTrgf+RSm/Gt8zPuOBdb2tuXegTUbGEvkilcPTti
 zW1Jgd23Ik7lbGn8qtV7mZmV59wtV+63G1YEakx4xvS17Xpm84aCRQ5sL6oD0v1cNjZpmet+
 2KVy+k+UZlLzlr0zNe7uCZM3d2Uwc7tzS6uoQJ412f3pxZQ53Tf+b2M1OC9+uvtYqv21aees
 E5QmByqxFGckGmoxFxUnAgCSFEUL2QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSvG5177E4g+cTjS16z51ksngwbxub
 xf9tE5ktrnx9z2Yx6f4EFosX9y6yWJw/v4Hd4mzTG3aLTY+vsVpc3jWHzWLG+X1MFkce7ma3
 mDH5JZsDr8febwtYPDat6mTz2P7tAavH/e7jTB6bl9R79G1ZxejxeZNcAHsUl01Kak5mWWqR
 vl0CV8a3G8+YCiawV3w7sIGpgfE/axcjJ4eEgInEtzO/2LoYuTiEBHYzSuz5epodIiEuMe3X
 fkYIW1hi5b/n7BBFTxkl7i7bzAySYBPQlZh0sI0ZJCEisIpR4mznfTCHWeA5o0T/jnksEC17
 GSV6Xh9kA2nhFLCXuLT/HthyYYEgiWVP5jCB2CwCqhJXry8CquHg4BWwlLjXEAMS5hUQlDg5
 8wkLiM0soC3x9OZTOHvZwtfMEOcpSPx8ugxspIiAk8Sth++ZIWrEJV4ePcI+gVF4FpJRs5CM
 moVk1CwkLQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHqJbmDsbtqz7oHWJk
 4mA8xCjBwawkwruQ/2icEG9KYmVValF+fFFpTmrxIUZpDhYlcd4bhQvjhATSE0tSs1NTC1KL
 YLJMHJxSDUz5enWazDe0vookt/+JKVec/rMxReXYVFl2/qri9y0C1asNGe42ZkyIe7Ho5ASr
 VdMvuqsLhL2V2h/7VOOH/Llme5M/D2PrjX1vlwk68N/p+lyzIqD6ok3C/6glOdI7L7zmLCvb
 KH/3mt+DmrpmIb8f37Rz79+3L26I1Z1fkuZx6YPQndwYBv1PU5O2bdky+WyIOAfvj9TAaZKz
 tJ5lylVJfPjlGbfZT++Vm9nURfcYhW2amRgk7sutVSit0Z7ou+hfh4J7QeokpQuL5nzlaJnw
 XcHP3XdHTV33kwe7Hx8+Z+H32Me5fk62b3iF6P/J62ZfEJ0ULH6ghWOhUaIi3w2fxi/+060X
 e06++10tTomlOCPRUIu5qDgRANdX/eI/AwAA
X-CMS-MailID: 20200521141731epcas5p3970e37a1b1b1986b75814de104e4a857
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d
References: <CGME20200519110323epcas5p23b9472d505f5ba58d033fa468cb9969d@epcas5p2.samsung.com>
 <20200519104904.59246-1-m.shams@samsung.com>
 <fa372f07-abba-a296-c315-e9769fb43623@samsung.com>
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, shaik.ameer@samsung.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Inki Dae <inki.dae@samsung.com>
> Sent: Wednesday, May 20, 2020 11:08 AM
> To: Tamseel Shams <m.shams@samsung.com>; jy0922.shim@samsung.com;
> sw0312.kim@samsung.com; kyungmin.park@samsung.com; airlied@linux.ie;
> daniel@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> shaik.ameer@samsung.com; krzk@kernel.org; alim.akhtar@samsung.com
> Subject: Re: [PATCH v2] drm/exynos: Remove dev_err() on platform_get_irq()
> failure
> 
> Hi Tamseel,
> 
> Same patch[1] has been merged. So could you re-post this patch after rebasing
> it on top of exynos-drm-next branch?
> After rebase, only g2d part would be valid.
> 

Hi Inki Dae,
Thanks for letting me know, I will send updated patch for G2D file.

Thanks & Regards
Tamseel Shams


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
