Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB81253E57
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9466EB2B;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A4A6E187
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598457151;
 bh=+JphGhQ16chTTvbMEA1xhpe7rQOqyDaFJ04Zi4/sdT8=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=DqvAowWyzDPJ3KGFvRofa9TRdVl36NqOp0m8S1z+ROI7h3M4DETJ1XCLCmgtH7abd
 aCkHLpsonLnce+b4lpiYkbZ7Y/1E2Zjm6tAm5muv74R0AYFMX55MSnURVz3DFjBfL+
 xvJ46Wcb0ALniSU1mU3b/1MbxNBmQLZlco+4yp14=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([37.60.0.235]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1kxH1Z0ivo-00mcf3; Wed, 26
 Aug 2020 17:52:29 +0200
Date: Wed, 26 Aug 2020 17:52:22 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20200819081752.4805-1-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] make hdmi work on bananapi-r2
To: linux-mediatek@lists.infradead.org,Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <17DF940C-7DE6-4B7A-B9ED-147370E4FED4@public-files.de>
X-Provags-ID: V03:K1:pJbAVylxOIPePMiP/ytzA4bysO6TQ/QaLoZqXRwxsIfHpp9zBur
 UC8ZWYEyUAPbBJETUJ6OwkZze+eErrhZsLBSl9oSAarWSUD9zihuDn+r1guNuaua0q67KO+
 1wy3HJ8763S6gLylE6bGtelRlWRS3jxwGWaz6ANdT5n7rtixuvXCklxu1b8MPGzKmFrVNZq
 DVlqjOVqd52zlCjK84mNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b74iCIBEbO8=:4Iy4PF1uZ/+DlHgoB3Tg1V
 g+HMrz6xMpTrN3VmNQhaMQpQyMkLS9Nwsnyv3b6rDE+he7FwqO8llT94KbVAalSFk7iCFyden
 kE2lU7yy9Mxd3czG10madeNFQfDQFvL9DAdrLpLXbbmw8B+jLXYUPuZuC+05wKdPnudXYtlt0
 drKfmwYxJg4TVPvsY0H+wfruwVrHdEc4APcO4q6FqjPTIV5CnYxSDQztzZehCM0RGms7ZeoB1
 mmE/FNdfhGgYra0iADiDoLVuQ16Ink7l+kNZ1xUM2r98XXUmvKEPgd77kix83n3fS40SAo2DB
 RXkcSZsVJuI4fN4TuP9PHsiLQtI9FLI/j1gVAL+JUUyUk0TufOHvMSgEz0waF0dRP0Aukcjrv
 cTfihHGJGrquIh95WO1DlQJk4+1EoxR1Rc69/bWBrSABksUDQKVli89C0TFzYmtcsZWwTPm4M
 u+dgZfV6nBedrtTROUijN25WpDLnpfm5l8B5gAxfWq5hMpaQHnNJx7EntmyRAqvg6OaQV8gUW
 aAAiPzthlB+ogKPcBYKUVJKhzidf3WkEbntnjvM7Viy2xJtkKe9Dq2hTPGOQNPMki45ahqaTE
 vs9Fen3YHq8ws3CfHk4x2GhocXq/yce0vcw0Gfpia7AUJFv0khS+CYypVa1qTrPmELsggrS7R
 HcOJ5q/epAjzJAp+5uA0S3gAP9ZCF9HEIp+jqhIT8tDM5HbI5RFs4ocRLY6Rg3GQk9nfbQ1Ym
 BgPcKvOp1VcqarYIVOybQSEFq752qxMMXV5namOgDevn14wJ57QQmJKclEKD2hsLzg2pfTFJ5
 HlcN5VECkupWb/UN85jGQpl1R5wfS+PNmxlW6vnAh3zXwtoVWrBFQSCBitB91gaBbrJDYq0NN
 8xV0RlKNGYwvmlmRBVWnT/PEwnYL+mZFNagZm+X3ws9TFbTw1mtARfE+BqL3VePc3shLgwoPK
 dWkHcuGP7OGWjsLkGTt4X5FiWsoa1Nk7UskCRWf01WcfXPrYL0RRFCgo7JYOPcfel0xFkXxHN
 R50EFcjYrZCUFT+wdKheqxlNdkaO1NjTH316TlY8ewP+/JMUa0y4cDRHq3k5me4m8zX+ZZ3D3
 HzhVqUjneOPufa+Y9CsTIbWUVYRPCKdOgb76c0aox4WEJxBwBS4v3syKOdEudMjFxtBytQU4/
 lkGLZPjdqj6d0a42Oa3ILcyLDGgB6o/QnQ/4l8nYmInqFXWwlWHNO/dtZcrFq8iUMbMJMr8EM
 IcUzzw3uNEYKI16HinKl9mVdSNoeI0GlzDkkWZA==
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Reply-To: frank-w@public-files.de
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a gentle ping...any opinions?
regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
