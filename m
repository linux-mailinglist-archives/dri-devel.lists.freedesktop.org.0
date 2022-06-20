Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906B55191C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1890D10E087;
	Mon, 20 Jun 2022 12:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A6210E087
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1655728843;
 bh=KrVmb1xepHJ/Pzbfeisty0gKJhBZD1PGHrbEMv3MWpE=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=OFohnXD3oQUdewpBCd88CsFYJB0h2Uy9sbJsqevrEQy6ZrLMemiMrQNpPzkTeZ12x
 kuCbjN+GS68fpEiIRY/+R26pW2Yd11cEQqI6RRw2+ThMzL8V9wklJL952Etl93ZUpr
 wNalXpekHob7C2oHjBySGMxsmxE9W/4HsywR+8u8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1oEyo41FXv-00TUH3; Mon, 20
 Jun 2022 14:40:43 +0200
Message-ID: <e49b8686-6546-3b7f-dda3-6b4efb53d66c@gmx.de>
Date: Mon, 20 Jun 2022 14:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] video: fbdev: Convert from PCI to generic power
 management
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, linux-fbdev@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220608180956.GA407517@bhelgaas>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220608180956.GA407517@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vj69s28dYdlp0K+pnq7qPonjf1zFbLqtRxTYLMIW3rnIz64pO0K
 GPro7+3Nk+TZXXbyqEDrpEeWKDeh1pazM91MBS6eDW/NULUOgMuFG0BrwPTOvIxgTCfJrw7
 cEO5qGh9+JrpeYB9NsDOx4Ql10Ly5RZ7Q9lWSywgjiC/0U4nVOh2MsaIe3kPxN4dnMD/R25
 JEhcKlgjDeLTMW5op8/8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZfI1ovxhKS4=:ICLoC3mKUmlhejdepfRPK4
 NvXiS9bgLm/qImY/psBb/kSI1M8w0FSG9t9TG/y/hSEkGOsLXP8kg3AjXEFVIZr23Gd0y+9Zm
 P4qDBwEjqjc3AJOeOMx8NU0yDJVkJ5TMju9bkmf377wPjv/6voayPgZL+Apbnr9f0262/JuVu
 raS95bjMEWP0PadIfiwDC6VPPUzhRnyt/KnXPyp7nwcAxKc6mKufp005hNlmzb4atyhjY3i42
 bIMrvqU9TR03xempBUFe3CiFz9wdKEfFwFGxWHGDWgJn+JYw282nJ4ewDZ9wXI6hdNFcYprwx
 864h/bsxlM/cFnIflK0QnGDeuoNbuATolEe63eBP3aD/L4Dsv2oUnVx6qCX9Py+mQhf30jn/W
 4HyDcnAU1bPGMNLO01oq7ateN+IjXpQSqOIRZDkC/xfr4A6Vg37q08CxB0rXNGMMNblCgbo6q
 VK8dij1RT4Hzpktb4GqEkE7EsPSVBWQv1V1y4Q/hLJLTmvw0UDOgJeVs0V8x7VM4mmhcNE0sO
 H+vWTXdSHvVbHPzFn4m+aUCrXPFqgyA7JlpLhddhUbTGzFVimKlwrv6/HNsESnBkvdA3Hx0RP
 3bDTgtrhQSDmPTFr2lS/o6iTJINP0n1sZqcuDLXh2UGXcHODKFGMaDKqRNjW1ytkXNAq06fAy
 4PHlNaqRkxtAma5WbXgQubbtRJ+57ri0vX8SxG/Fb2ydaY5CqhThi+AVh3ErPQ77rCUBHz0wD
 7fJtvWyXkOOhRlvHjFXzEib0/INKydLkFlbU6M59i0fOAJmSP4hvrrTtURu5o3Fp3525YDnbW
 +iTzhz++W8st9zOU/LB3RnpNsw6fIZkadMmjYK7iNYWkE140SSMl2d21SSgo7KZbxM049EXD/
 mdxeXshOFOH6QZare0AMC7h2d0jIwOzPxSiWXd5zAsp3wFomsp5SLjIg5EkpMmW1lgCI/wT8n
 8AUrDnyo6NXxIrr0HRUgQjgSI9cxBZ4Qpa05egXeakQBohdVz75IS/QvdZRuo7nswJk3sK/it
 JurjlrY3arwpEAaUy+E+OvP0TIvcIITBRax6CrmvD841dXNJvQJnMQ+YcKPZeqmK+Oi5ssuyN
 p2pAhU0OOYWC54xoyaIMG1kxIAM30kHYkbQMtBvsO20FLE1yDH0EhzNjA==
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

On 6/8/22 20:09, Bjorn Helgaas wrote:
> On Wed, Jun 08, 2022 at 06:26:34PM +0200, Daniel Vetter wrote:
>> On Tue, Jun 07, 2022 at 06:11:10PM -0500, Bjorn Helgaas wrote:
>>> From: Bjorn Helgaas <bhelgaas@google.com>
>>>
>>> PCI-specific power management (pci_driver.suspend and pci_driver.resum=
e) is
>>> deprecated.  If drivers implement power management, they should use th=
e
>>> generic power management framework, not the PCI-specific hooks.
>>>
>>> No fbdev drivers actually implement PCI power management, but there ar=
e a
>>> cirrusfb has some commented-out references to it and skeletonfb has
>>> examples of it.  Remove these.
>>
>> Is this holding up some cleanup on your side and so would be easier to
>> merge these through the pci tree? If so
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> for merging through your tree. Otherwise I guess Helge will get around =
to
>> pile them up for 5.20 (or 6.0) eventually.
>
> No particular rush and nothing depending on these.
>
> I added your ack to my local branch and if nothing happens for a
> while, I'll merge them via my tree.

I've been on vacation, but picked them up now.

Thanks!

Helge
