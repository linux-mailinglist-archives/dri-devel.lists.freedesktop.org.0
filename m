Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B315B25D1FC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2EA6EA96;
	Fri,  4 Sep 2020 07:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E5B6E090
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599145642;
 bh=8R68AIlx4OoapEV9eDfkFEfV8WdKN6gzUcWaRAO+AvU=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=FT19T9Kf0lXT4621EFUCYRiQdFSNl8L5tvuDwqDoA9kasAz/SYybSopDC64pSJIEs
 YZEUpVw3D3aSN6n/uWfbNAkrBxPM+yFj5O2fRspMZX4Q9Cds+USlTQzg/4ptWpb+VN
 ezFZq3rYh0Ho32rpoiZuvpz/9pQ9v8/sgTxk+E/A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.148.118]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1k3npE476D-00YT2P; Thu, 03
 Sep 2020 17:07:22 +0200
Date: Thu, 03 Sep 2020 17:07:15 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20200819081752.4805-1-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] make hdmi work on bananapi-r2
To: linux-mediatek@lists.infradead.org,Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <3B754053-BA89-4DB7-A089-665C5B6B34CC@public-files.de>
X-Provags-ID: V03:K1:0M3LhMUDc3zMbEzp+O27j0jh7FY2Qc6/35P77yj2d3hoCi5xih6
 tzJAQ21lNqguoddgx6+yoW/vjJk0im+FKxZ6xmmzOU9kE/Dk4L/pYRvLc+mKWVfZs17rtKX
 rBy5IZuHp4d5JQnh8Yeohh9Oxvtu1lJs4ccBVLFEo0itZa2X68yyHZ0PmoWjSGfA/8/o+Ks
 tyFityHCd+83zAE/rEbDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bpJu/58zYQI=:cDQCjZiMvEBa+NcDHdthnm
 cz9tsefw6Ev7GQyJkYgPAT7D3XqMkkf6z+aQObkQPRfzr7o1Hsk6RXW6dD9f2DVOc49dTitJ7
 5PBa1yLJ4p5WLhk3unO1lNIMOtLTcivS1XfqbjK9coA5RHjPlY+5t0pfKXbDUrYlWzVUutoEV
 XhEtVrucsFCuuOWyv+6Z+08n2Y0a29E/sOFhTEHYOUB+h9tv7xNTXRPhjK4Ehjwxl9GRy9S91
 vmZCIKGhGBLQyvNICk3eqHbuhCHCItMW47udK6dquOfYH6/DiQr9u/GqmtL3YCjelerfmtj9b
 CWVgBIpNcH8cN8O2/qr3bg/6r8IZV4EScyk7oKNupTYT1wYctLG5f1GAX9l2cmyApxbJ1DLXq
 bFl4hAHq+s7+5KfjQ2xBc2FpCZMdsAjFVZDu7mPbqtxAet2Z+ZHLLYGZECHlmZM7Vn0DCQj8v
 MSaPCjwn0m/CR4Px8K1r6kCfPXoZLb/AjrqJwW6w6xo554ndD9icXiv5zgRpS4oK8ysrLN7uE
 LWfo2D3xdckg8RnZ6apSDdsA93al+k/4zqGNjE1EWK0tUmwuEIphDAjzRhIh6f/1jsLusrwF+
 LGjI8xosUoioBLLNOX+ZdcnWhgKMiz9WieLPgavVqzRLg99lPC8VwWYzpmWatkbWPaVEFE2MQ
 FYsZxGUiH/hpHMgII9s9vFTMYskcbHyvO7WN4KwgUzP0mFUwYsl/wcRuJoSD8U3cKw/Uawmro
 9yx4xwy6qvc5vS3JnYFu8vs+e4fgNN3fXHA4bRmFHMkTz4T2fr9q3V9EHAKHZzxmzIYmJxPy3
 /HQkjyvuitIkIjQMA0f4e3sXcccfvo1bhAUZsvp8olp+xe9OS3+q11AE0WfRjOL0LkqlxFCsy
 AFirLE/rcFDYRscQwyGOudjLxq2mQOr9yCxN1fRKPn51ns3y46IJLs7mSAZ2R8OVenMo8G+NJ
 zBxYN0PqLlKK4NRp4d/SpZfKPe8ZbM5ljb6U8RiyFu9r/tJwREeK4AnmIv7MSYFTngLx6jwoe
 vFx3lZ4gv2J6IrX7DdS9uc9yrdOga+H8/bdor8Ov017z54FDaoTKIyo8/fZ7ZwYneEqHy/hlZ
 zQopCtGm9hFvvoOqrrbeZ//f35AcMqD8Qq2xN88ktYoGQ09HTxuLFsO8Q9EURx4ZyQ7bQWCkR
 7E95ASHkZqwa9KVHXveawqoHoH/N9D2IphJYxw8+y1dB0heDlAHMrzIi8CEyb3DddKCwZzdEX
 RNFQeQhqhdnM71xdANl367E4zB2hIVDw0y/+FKw==
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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

Hi

Any opinion about DTS Patches? Which maintainer will include it in tree? Is any ack/review needed?
regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
