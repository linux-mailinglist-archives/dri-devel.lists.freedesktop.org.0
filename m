Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F748E220
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 02:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757E210E1BF;
	Fri, 14 Jan 2022 01:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jan 2022 01:25:24 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9109010E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 01:25:24 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220114011832epoutp02990643bd7ca0ee0b6d70d4fb743da426~J-kU7QocP2239022390epoutp02n
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 01:18:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220114011832epoutp02990643bd7ca0ee0b6d70d4fb743da426~J-kU7QocP2239022390epoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642123112;
 bh=K0OyxvtMr52YMpKcDKFt21xBQL67LVQspixlM2YQbT4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=OBkIAwZHkcFcqVlS/JcaFgY5btSYOYxcTDxmLRA64pLIx3kej5OfNZ/cBXRnq1VeF
 uPDIgDXQPR0b5i9/pp3rA81/TlDejqAxlGkRSS8z0Zi7i8ljByQ9esXCdS1moLzC++
 11Wc9vr+XmJlYI+p17uuj6+tjRALlRh6FaWO86b8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220114011832epcas1p4568a0e298b1c483d790c882acd78c7a5~J-kUkZ5Ab2532925329epcas1p4s;
 Fri, 14 Jan 2022 01:18:32 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.233]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4JZk2S0sMBz4x9QV; Fri, 14 Jan
 2022 01:18:24 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 CA.36.28648.75FC0E16; Fri, 14 Jan 2022 10:18:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220114011815epcas1p4e0d6c929fcd7e2e7f4059b3d2aee9c9f~J-kFV11AV1691916919epcas1p47;
 Fri, 14 Jan 2022 01:18:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220114011815epsmtrp159181747b293813a6012c873771aed56~J-kFUdsPC2266022660epsmtrp13;
 Fri, 14 Jan 2022 01:18:15 +0000 (GMT)
X-AuditID: b6c32a39-003ff70000006fe8-93-61e0cf57fbf0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FC.4B.29871.75FC0E16; Fri, 14 Jan 2022 10:18:15 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220114011815epsmtip27bfe8541ad95e9a7108da9eaf1761573~J-kFF4joj2570325703epsmtip2H;
 Fri, 14 Jan 2022 01:18:15 +0000 (GMT)
Subject: Re: [PATCH] Revert "drm: exynos: dsi: Convert to bridge driver"
To: Robert Foss <robert.foss@linaro.org>, Jagan Teki
 <jagan@amarulasolutions.com>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <0804d45b-7ca3-1e2a-cff5-038309bea686@samsung.com>
Date: Fri, 14 Jan 2022 10:29:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFytb_huJfmzPxeOwwBKbRjD0KXq1X49G2ODbif_e5cYp4g@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmvm74+QeJBpsmW1vcX/yZxeLK1/ds
 Fl82TWCz6Jy4hN3iUF+0xadZD5kd2DzWfrzP6vH+Riu7x+yOmawei/e8ZPK4c20Pm8f97uNM
 AWxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QGco
 KZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMC/SKE3OLS/PS9fJSS6wMDQyMTIEK
 E7Iz/k/byFjQwVKx5/QvxgbGxcxdjJwcEgImEl33VzN1MXJxCAnsYJSYP/kpO4TziVFi7ZMp
 jCBVQgLfGCW2f4mE6XjQdhyqaC+jRP/rv8wQzntGiak/5jKBVAkLeEgs/vGRDcQWEQiWOPjr
 GAtIEbPAHkaJb7Ob2UESbAKqEhNX3Acr4hWwk1gytQ+smQUo3rj6BVhcVCBS4v6P5ewQNYIS
 J2c+ARrEwcEpECjx6YcnSJhZQFzi1pP5TBC2vETz1tlgB0kITOSQuHpkPQvE2S4S0xt2MkLY
 whKvjm9hh7ClJF72t7FDNOxjlFi+6ySUc5hRonlnMxNElbHE/qWTmUA2MwtoSqzfpQ8RVpTY
 +XsuI8RmPol3X3tYQUokBHglOtqEIEqUJI5dvAG1V0LiwpKJbBC2h8SfZ8eYJzAqzkLy2iwk
 /8xC8s8shMULGFlWMYqlFhTnpqcWGxaYwqM7OT93EyM4jWpZ7mCc/vaD3iFGJg7GQ4wSHMxK
 Irz9RfcThXhTEiurUovy44tKc1KLDzGaAgN7IrOUaHI+MJHnlcQbmlgamJgZGZtYGJoZKonz
 rpp2OlFIID2xJDU7NbUgtQimj4mDU6qByWJzx/c9re9uvuPpavY//0RLcPqBOslNRwVev315
 7Mmc9xvdugz7v13+u/rCYfEetb/H3umsdE3qsb31Z1l/6fyyFXe80r9v8PdL4HU/seCE19Tf
 TrdTjs4WLku6bt1RFNN23PrslKXNWix1R7Z9P2M2gX+rX9X+Ju9cCSc+P+G/SeHak/mY/rvf
 1nxStIZjW0/IGSV+Xa35035JRZ84r7dX3CxV9rjlqa3pR3j9t15NW9PKu4rPWe31Mu+X7/cH
 eJ02ejfvI+9lD4koUUcvfTNBNi9uw5vTJpY9cI2aJWAYu91Sa9OMX7WWCeYybGl/fbhbX/VG
 Veotfad9dtPk+Vf4pV76V9scMbph8E+3S4mlOCPRUIu5qDgRABAy25YsBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSvG74+QeJBhvPqVrcX/yZxeLK1/ds
 Fl82TWCz6Jy4hN3iUF+0xadZD5kd2DzWfrzP6vH+Riu7x+yOmawei/e8ZPK4c20Pm8f97uNM
 AWxRXDYpqTmZZalF+nYJXBn/p21kLOhgqdhz+hdjA+Ni5i5GTg4JAROJB23H2bsYuTiEBHYz
 SjTv6ARyOIASEhJbtnJAmMIShw8XQ5S8ZZRYsfc5I0ivsICHxOIfH9lAbBGBYInD/6+zgBQx
 C+xjlPi79R4rRMdtRokvJ6YwgVSxCahKTFxxH6yDV8BOYsnUPrA4C1C8cfULsLioQKTEuuPL
 2CFqBCVOznzCAnIFp0CgxKcfniBhZgF1iT/zLjFD2OISt57MZ4Kw5SWat85mnsAoNAtJ9ywk
 LbOQtMxC0rKAkWUVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZw1Ghp7mDcvuqD3iFG
 Jg7GQ4wSHMxKIrz9RfcThXhTEiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBa
 BJNl4uCUamA6188f+jm33DdVWTd+HaNG8tWvd/J/SM860jzP71TUTqvtb0RdT3JGsFqdWnVo
 0jbBx5PX7Z/0dlJ/CtPl3NOlX/K/bwhcOrGlm6dm8Uq+0oM/He5sVbn0VeXnno2BkZmlveW/
 zt/7evlY+KmZctduqq9eUMEzX/S524N63b0TmnRTdWtMHUxNin7td/rq7Dwx6ua90hsKy5nV
 MhhOfKoNOTWbcYrIzRmHak0uB6+eLpvQ/G1HSc181qBTHMt3u0zbqj1FYJenyaZnn2sW1P1S
 UmbteXxn92GFlFO/yp6/CNHl97t3SH5JwqtpAQ9OBAWvuxYwRaK76fEHiZ939pya1JqwwS4r
 rv3vVlabyQ931iuxFGckGmoxFxUnAgBC7ZxaCQMAAA==
X-CMS-MailID: 20220114011815epcas1p4e0d6c929fcd7e2e7f4059b3d2aee9c9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220112100521epcas1p10beeb5ac3a77a212810822266badda3c
References: <20220111184347.502471-1-jagan@amarulasolutions.com>
 <CGME20220112100521epcas1p10beeb5ac3a77a212810822266badda3c@epcas1p1.samsung.com>
 <CAG3jFytb_huJfmzPxeOwwBKbRjD0KXq1X49G2ODbif_e5cYp4g@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

22. 1. 12. 오후 7:05에 Robert Foss 이(가) 쓴 글:
> Thank you again for catching this and submitting a revert.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org
> 
> Applied to drm-misc-next.
> 

Trivial thing I think but just notice. With this applying - original patch set and revert one, merge conflict may happen on drm-next because drm-misc-next has this patch set exynos-drm-next tree doesn't include. 
Leaving this patch history in drm-misc-next is correct?

Thanks,
Inki Dae
