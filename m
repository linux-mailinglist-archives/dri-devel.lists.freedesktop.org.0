Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565166D1011
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 22:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9A010F021;
	Thu, 30 Mar 2023 20:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474B910E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680193114; i=jwollrath@web.de;
 bh=bWpippm0b05Sg9qtdaTOusU8ULchTjLroRcDWrGiXQU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HhxBARu4oEXLb/LdaTUMDGuPFlAQdfo0kc7VtaZYtcjF0AUgEI3rRfteQ7sidLkEN
 Xjtyj2I596IYpbvSg4ruyC9/7VTsoEFW1vj1HlA1nJFwbG4QbbLh/1GGRhQIEnR5yZ
 cXW0Cfgn4/Q1abWe7iHDOsUmqaY1CvpRSBjeJFQOdPN2sr3HBZNFjvVIwLilVEHCcQ
 uyhNR2i1JrWbACU7b2N6rDEEoaLZCrw/cvUijJC5qx3hKnlZ+vhPwLinMey1BKD9g1
 VOicMz/GPDGyCmF/YIDwOwwK/BEPlfpMaf/Q0uSRYHnaAQ96FuFtk2y426LaU7l59C
 fUIDy5j8LclPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from schienar ([128.141.229.28]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrLL-1q4F3K3nJD-00MlUg; Thu, 30
 Mar 2023 18:18:33 +0200
Date: Thu, 30 Mar 2023 18:18:32 +0200
From: Julian Wollrath <jwollrath@web.de>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [Regression bisected] v6.3-rc4 Error scheduling IBs after
 resume from hibernate
Message-ID: <20230330181832.43acff4d@schienar>
In-Reply-To: <BL1PR12MB51448B5D88C17FE50CA34763F78E9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230330160740.1dbff94b@schienar>
 <BL1PR12MB51448B5D88C17FE50CA34763F78E9@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KAxMOEBd89/0lclJcmYWbonPGwYyBIaK0XHQWcpzMoho3owTLY1
 tnvjiH0ojTKsMCb/8WtM03ORLpQbceZNEHh/iP7HY6p2r6EWcbQ0mNkbSSl6AfCmkC5eVHw
 p0nt+p4Otq7Rpd7baDTrWAyUlFddehFWlj5HomsxPtHYwY55otIsY3d93ihvLPoNrJXxV8B
 tDcavkNSBcPUB8+AQYKWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7oeB1IQTkpQ=;HUALqVGLewIrDij1gZ/dvClxtCZ
 holv9mgogaARkcRBGyNc47dp99hVOm4Y14jIWUbu2vnbUWE7rlJJCJAAZ50UPb0KQU9gujtgF
 3OSYUsXs9fSP3cCzsitkI56BcLH8eCP3nIv11Senzn1cmp+6O4HPnL/0W/Wimvol3BrTW6s6q
 Fo1+iQeQawMxN6ft/5IiRfxRsPH2ak/mUWZLD3PL/1G4tdAGsi3f1IyMH0AFyYTN2zj/xYMCY
 zPmcctte9q+NrnheEZ7NYBV2m3KqB00xo+4MJiB/7BvXDgD0+rhlHIW5eKU65c8NghzjniWTM
 0rlXkfxrgJ1EqmS79nhbVeAxcnGWEojbcxh48GbOaZKYpNwlOF5F2/AIh7TCUm3xkEPOfUg6z
 TUzWYpU9qn7KPf5d7KIhC+rhTUwzJHI1t1ZoxfakH/nswf9Qxnv5V5gj6g58REzewVVemELL3
 j7aS0uZDk3POnnm+AUUfaYhefmK2NL7oi/OBXieWbZCAZvOAWWZq6FzE1ml6PF3RX1yAGdnqg
 MdmljcSyCdnITdD2N/l4r+c+2xf7eOjMcpW97KEA7YJ5apJZj2Y0Qi1rfhVgjjFqIzX0dfjqA
 rnMRSD3lBdR8oJF4tgyIXqmRYZ3ll86OHUgDXXx4StqUjhqNgrRwEJC1PANt4x5m+5/X0DvWo
 l0Cx7VeUjRJQ/CsL2xGyJe1RYE8yjWO5QyCHsEfxFVu/TRBLBIO0jAM0uVWRoSreZ+iNXIFHd
 86aqAeHu4OxrPNXXHvGib7opa+gsYYIDJLOfubDFvzGeF7VXD3zqbSLysucZ8SEkkJCvGW45L
 Qfv+jZppg6QS81kWikUnrGB0u2KirwJrx8FvG6XueMIbzHguDAr8xIgPj5pShRmj/vR9WZ4ct
 p9CW1pGI/Llchw7r1C5VgDcFl25pSX95ahfMNtKzcqUINdFu+iS1C68SEOQobBRanoE4vfpAD
 uVNQCIj8usIbGgM0iR2eGLhfoHw=
X-Mailman-Approved-At: Thu, 30 Mar 2023 20:34:14 +0000
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
Cc: "Huang, Tim" <Tim.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

Am Thu, 30 Mar 2023 15:22:34 +0000
schrieb "Deucher, Alexander" <Alexander.Deucher@amd.com>:

> [Public]
>
> > -----Original Message-----
> > From: Julian Wollrath <jwollrath@web.de>
> > Sent: Thursday, March 30, 2023 10:08 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: Huang, Tim <Tim.Huang@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>
> > Subject: [Regression bisected] v6.3-rc4 Error scheduling IBs after
> > resume from hibernate
> >
> > Hi,
> >
> > on an AMD Ryzen 5 PRO 4650U / Renoir (amdgpu: added device
> > 1002:1636) I the screen basically freezes and I get the following
> > errors with kernel v6.3-rc4
> >
> > [   26.214541] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests
> > [amdgpu]] *ERROR* IB test failed on gfx_low (-110).
> > [   26.379624] [drm] ring 0 timeout to preempt ib
> > [   27.387884] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests
> > [amdgpu]] *ERROR* IB test failed on gfx_high (-110).
> > [   27.392945] [drm:process_one_work] *ERROR* ib ring test failed
> > (-110). [   27.400370] amdgpu 0000:03:00.0: amdgpu: couldn't
> > schedule ib on ring <gfx_low>
> > [   27.400384] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> > scheduling IBs (-22)
> > [   44.440532] amdgpu 0000:03:00.0: amdgpu: failed to write reg
> > 28b4 wait reg 28c6
> > [   61.177118] amdgpu 0000:03:00.0: amdgpu: failed to write reg
> > 1a6f4 wait reg 1a706
> > [   61.189275] amdgpu 0000:03:00.0: amdgpu: couldn't schedule ib on
> > ring <gfx_low>
> > [   61.189286] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> > scheduling IBs (-22)
> >
> > I bisected the issue, the first bad commit is
> > b589626674de94d977e81c99bf7905872b991197 reverting it on top of
> > v6.3-rc4 also fixes the issue.
>
> Fixed in:
> https://patchwork.freedesktop.org/patch/529751/

thank you. I can confirm, that this patch indeed fixes the issue.


Cheers,
Julian

>
> Alex
>
> >
> >
> > Best regards,
> > Julian Wollrath
> >
> > --
> >  ()  ascii ribbon campaign - against html e-mail
> >  /\                        - against proprietary attachments



=2D-
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments
