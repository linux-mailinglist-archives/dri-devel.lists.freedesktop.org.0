Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED07A308EA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 11:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00D710E1D9;
	Tue, 11 Feb 2025 10:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="bUvigBNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398E910E1D9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1739270529; x=1739875329; i=markus.elfring@web.de;
 bh=OSHQXJVDmU6SV3Z91F8kaCXOiiG5oCxvSWGJam0x8yg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=bUvigBNkmTH4ndoVYsHo1tlhwRjjdsLA0gT18pYDXY3dbO7/VfsMZn/owZt7B//U
 IQsSYbpYe1Is61sVML/6oL2bcYh3N9302gA0+3WgefBxmgrnpIpen6wZ1C4e1hCtg
 Bd13dxoNNWGvt5ihg0Iyw12A6y5flqkVh5lDt96c6xz4/29ZzpGIO7m76aXA9l4rV
 EbkV9mv8oeYFGkv5EUcVoMSwYN0FiTGIQTy92zLzkQT4xvPM6tq6k++v4lr29HeYt
 zdXCIQtZjzUkoEEUo+qcnU+MlSzoK4uh9DdbEnXMR+hhYywgG9AlTHKwd9/jBFV8e
 zyhB6iVy3aGq7SuSlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.9]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLmq-1tuVKE3sVm-00Opoi; Tue, 11
 Feb 2025 11:42:08 +0100
Message-ID: <10bfed13-107f-4f84-967a-28985613dbfd@web.de>
Date: Tue, 11 Feb 2025 11:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
To: Charles Han <hanchunchao@inspur.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20250211102049.6468-1-hanchunchao@inspur.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250211102049.6468-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VF9iBVjP7Bc1WrNqr5ehNEGOQ+3CrQ4P+mDm8+nOW4HDm84jUYX
 +oGdg0sLuCAKmEtil8bp8BzGEhRo6M53GnxJoZRfkYDKEMCGqYMbhLQQ6CMAySNRIuJXjRD
 MjLlYCI/AI8yvMEU6JQYArWyR2jGIL/aJKljSEuLHFVxNHokFbojJGctVQuY3TYSjgZtNaK
 fEw8r2rH1Cu6je/gOlE4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HdrVnq9INRc=;FnTXg7AbGVetljO/FZU2SzMHIjf
 WkMc/F7nJGWJNnb0SgAlMJHji/JO1vfL+mPH5WpzjReSujSFajQRixQ1hDAs9NgiwSYgA8Wg8
 1rAO58C3U+aqc6Bmrv9KyYH+PPJluhV0PzdSAFk9EhXt+B78TJkFwfJtYTCEhSRPGWYSjoNts
 xWdGE8saEIm/n6qj2a1E0CnmaRYjKent+JUiqFRKPSlludoQj7K7vEc1RQRLTtM0BWzbgcEbx
 XSxDnwrb3ORFEmNRfnXr3nSBs5XtiAISkfhb+9Cht2NmurFliidMOxlU+Pfql/w/pi2w0Vh7V
 jW+IRrz+L2Dla6sgTk+DEhu9L2uhy69Jq20uTQlDRjKELHxrRe7LCKosbnZ5EwJHpehQ1d70o
 Bu9s/AhAEzHFTdF4S31xiLByG/QdapbeaZ0ZUHGLwdt0RMtNBWF/SzSZRkZsAPcikrP+naQRU
 UQpMDt9I5tMXoeomDLEAwMdFNLuzALJoz7jei/1y+TPH74H6Cx75xqbbUM5UUaturutxnOAZT
 8eLqOtJb8YAZ7azFuR04vKbu6ZOlvW/dRZ58QmPB7VpVac9ivBektPjXVgSqoSdIkuk5KMF7R
 Hu4OmiY6IWXZY1326oaoreZcEpDJgMLOYyVubG2XsY/lIhbsHm0bNJsbrVNx8lL2cvDT6qpGX
 s7K5lo3UCU06Kk2btdKUre9sUOqO9Zn9WfeBSX1Znswaxqi8kiDIRc5fpd1WVT+9A9CKXpCc1
 cZtq5bxvPH+nVg/v0RJd4wmubNvLoO6dJvtT0ULM5wo6JdLPqhOXOKl6YwX8arA9YP6ptMVXi
 T+SjSFOYWfJFjbrR7zs/dqWCKhM8eAyblekmoa8mx0HsmTQP80v8BGHe4xYSlUZobkH9Tfs9w
 Imrx5vsN3me44QXDr91GGJx8teWo+OuBDIoZIJ5nWTsVgomGXxWMXxMwaXLPog25tt3TAsrne
 RIZ5joYaNpyMEgNdJGLW+NTFrndertUW4Fi3cHG3mlbb1dWtaPeESMejH8cUYn/Ce/zUpxSO9
 Jcg+q8eZC61MsHis7ezyfj/ynUd2piBPQEdpKyKK4dsZm0X6hETO68AlDLvtGXEw1+e9O6lZV
 HomOGQf+vA91/ZZWL2+nyWUM9pTt55dEPbekWyZgxWNe5gW8kyO+h6iasselSs/YwulIrBK4W
 E6MhCvbli0c/vrzwuMU43pY99wVp4ppAKabfzD/+eRfexUlHf2dDRRuvIIny9ekH2PCgpx+N9
 Kv6jBFncIGBnktdQJkLthJQAurODKHy9Vd3U1VEv1vt3QJh90RXDZ/8tn3x8qXCxRrBGDX9b5
 MvANZWbVnoK2Ve0DHxEiIr5reqC81ZGBpMhTIvAr2+ckoC1Ze/JlgQg9dFjonMF/m86hk/HH3
 zHGZLppQX5tb8ru+GdLGldwO5szN88sQbulWLJLsSG5Tmia3OHsVeoEYWPIg2NJqC6rNeVicP
 6OueuBYbr4TIp6LFEDqwUJDBGmaY=
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
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
=E2=80=A6

See also:
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n310


>> I will read these documents carefully.

I would miss more desirable effects accordingly.

Regards,
Markus
