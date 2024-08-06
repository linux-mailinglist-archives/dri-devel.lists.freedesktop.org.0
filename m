Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB1948ADD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 10:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F2D10E2FB;
	Tue,  6 Aug 2024 08:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="j2Q75+53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5236510E2FB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722931527; x=1723536327; i=markus.elfring@web.de;
 bh=JvBlAEYgusWTj0QaWz9xN+asB1hck3mH8iVJh7BgJpg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Cc:References:
 Subject:From:To:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=j2Q75+53GKtD8ltL8v/rJUSVHt/xrnCbr1o4+fvy9xYoWUB0NeFVwQYdjEw1USz/
 DFz1/6k50lKPnt1/Dr9QU4vZgIx+ZJFbVxRHZMDl4UZZ8o+fZHeyCcK3aBrdMJu9P
 3UqgS6hsuuiQJ/pCE5PXJo/Ohj5r9pypfJimsPiOBdopvGP8MNSk5LW1jGHceUBNE
 9RDwQxR+/4nrh++AJkXP87fe/GGa2p3ISy84WICpVh2B1sR9QZFanhe2c7VXtNtuE
 7TXeWqlPWAywktR1aGJQ0bqGVDSujdhTqZApwjGT3v6hy8i3+fDTHOnyQXZgqmenZ
 BR85+vO2iJFjTeoiKA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLARU-1stKHE3sZ8-00RcDj; Tue, 06
 Aug 2024 10:05:26 +0200
Message-ID: <f66e2016-d2c8-4a86-9a6f-267770f7fed5@web.de>
Date: Tue, 6 Aug 2024 10:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: LKML <linux-kernel@vger.kernel.org>, George Yang <George.Yang@amd.com>,
 king.tam@amd.com, Max Zhen <max.zhen@amd.com>, Min Ma <min.ma@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
Subject: Re: [PATCH V2 00/10] AMD XDNA driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
In-Reply-To: <20240805173959.3181199-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:40qaAv4KOPgJzTzTPF0s9ukKOy3mNK0F6i6IblVQTee0t5PBElZ
 G1Hsg2Ry/1dtEepcPkKutsPeaIfCf4ITz/3q1poI2Ro4gBTrYyJBkBLukBV/DWKdsdS8Y0C
 IpPTSxWc/Kur29nqGn8/PYzXFh5azRpGvCuKptYEoIBrA4Cx8RtINrXq35ME2EnhLa0YhED
 QExKQOpazQk9ThV3K+Xmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TQBqRqh8Cm0=;DkccvwdTmLkOGrwM5uN+WZjuOu2
 rBJr52d/2ivEotKuSLqfx4t7t2i7dfPJt9y4nfZyYKbJ71SuG53Va7e97wnMHNIBTNdgjbCK1
 /nc+5p0qK0XFV230+jB/xs/wBEnH/I/ErsBs5cNIwo1nqMyiMpHIu75d1fKlbzbq6HsEL6qHW
 lnIkgm4iRFTnPFSFk5J0X6+754/08epOE2KSrqZ6XLJE+lIPFobmIGNWuN4g9iRPmz7f81huX
 jEBkzpOuULBMqEwOUbuhYdjQ84GR+cqXplESuY/R0sXLZrUVB9f5X5N0Y0OeohG3g8CL8Kgig
 rL7ojDpwazJFhMd+YZ6Rpf4r777nXlIGe0Q75LLgD0Q+c7Pbf1RxjUZLySsdH006jI9rQ8Bg8
 AO5GB579onu1OVbO5ONxzHgBMNICiVm75vUuy1sqi1LFWEXJaUdSVZCxJMcf6Qm5K9yteY5W2
 YWbaMbKpsRo0ZxUBkS9hjUHfG2MvZs5q1S6EqOJ/4nRix3lyxYqdEEFmI00m2TSbie7JXEtpo
 nf21BDXsLmmpECplQjLrmtKZI1hlcfVkUZiE6oiBTXgXmDOVn/5UNRfUnhlHuup886OydCN8s
 y9WFca4xg9AP5w7nEIEBr0C7SqxT4XDsIt67cEEUhyniV9wUj+7dalnzy2Cd5IWZTfLc/BJuA
 vAomy5Lucb/o3ridfZRWK24sQ/GlQ1P+XliPjMVZeI9a+8h9g3ztvZ/QrSp0G9GFn9MazUeTn
 hNxLgyXJ3uRHXytOXLnH767oMLZqV8npy0UJpNKGQZOOMtz0L9FEtPLkXfTibJzIq1S0jxrNr
 6tcK5QoBkH+hCwhqggv+Rc7w==
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

=E2=80=A6
> Changes since v1:
> - Remove some inline defines
> - Minor changes based code review comments
=E2=80=A6

How =E2=80=9Cgood=E2=80=9D does such a version description fit to previous
patch review feedback (like the following)?

https://lkml.org/lkml/2024/7/19/803
https://lore.kernel.org/linux-kernel/010a46ba-9dc4-e3e3-7894-b28b312c6ab1@=
amd.com/
[01/10] accel/amdxdna: Add a new driver for AMD AI Engine
=E2=80=9Cguard looks cleaner. We will use it.=E2=80=9D


Can further adjustment suggestions be taken better into account?

Regards,
Markus
