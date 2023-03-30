Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F56D1010
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 22:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244810F020;
	Thu, 30 Mar 2023 20:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 30 Mar 2023 14:12:49 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDEC10E2D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680185567; i=jwollrath@web.de;
 bh=nIdrZL8qsAa7/t2YtVZmEN95K7OqsoZ89o4vH6A2P0c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=TQy52Z23AGZeQGqs4MADot0XfuGxhn/2dcSKeyK0o+lb/rWSr/yIOAlAlUQdc047g
 npVmCeXCvRoz8qRspdGBbLVyxAzm7aZK+wSPN6NL9xsIeoN76fBiAusUxlGofhMfC2
 FKgb29u9lFQJSTTJsRLukA+xm7GgA8zsro739zl17xa8ZLW0BrMM/DpxQmSZW3XpkI
 e2BKmMQqXlArsqetcmxq6fUPGKXy0QTcnAMcMk0jPhVWPuXaNKR+WmeeBweOznGNQ8
 iKSyoDOaBzcbUi36Q88xC2ABEspxYl7xjBxG5iKzCaxXYNu5BeBIPfrc2UxFQ6uXlo
 w0UxrmQEyBL/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from schienar ([128.141.229.28]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mav6t-1qJQPe0SL5-00cUPd; Thu, 30
 Mar 2023 16:07:41 +0200
Date: Thu, 30 Mar 2023 16:07:40 +0200
From: Julian Wollrath <jwollrath@web.de>
To: dri-devel@lists.freedesktop.org
Subject: [Regression bisected] v6.3-rc4 Error scheduling IBs after resume
 from hibernate
Message-ID: <20230330160740.1dbff94b@schienar>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S+Z+YaOSIJzMrfwcmGAbGe0/KMFKc4/LLb6WiAeXH96Hjttvyyf
 Up7ONQesrYouPm6iSvlmVk/f4Sigl1T5ioO/PfmU2kyriuBQTyIWrxi/ELNS16PnCn4fw3c
 mSUD/aj9XMntJRwjP7rp/xx5cr2tfSButoHZWRaseq+hQB/HF2mGr/teTrSohcM28o56VZN
 tnKM8IQAV0eLK6tyJsGgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zY/fU2urYOM=;jwTp8jeqqZa1q2qRklG2FoJD0dA
 wMCXMpjQyuEJ1utK2DGhny7Takw+8+koaIkrA9Zt6hiqK24TeX7e9sJpAPZ+TFfSCuMg5Zi8U
 zbA+1gnquP7kqlP5tWCT0A0QmZUJVrMbh+CvvJTP4IV1bR2jI5tCjE1P4L6tJ5vyVM47KqXAf
 V+DlXkhhYqlViZabCqhpVrWA6xtel3dJcK7UahxlWvUDxMCT2V1DwYrlH8LRzx5k+YDECJ7bB
 ITy3FaSEV7d7zP3rA479OCVe7rd5tfgflxyyaRgWdz5uqfqprKDtbyG7CygWdAKMLhHRMjgIM
 V0i2jucXDVOg6CIBTg3MUwZvNNX0AcrJ87XR22HslD3Gb47atbZzuRbPprkcQ4y2dvK1xoUaK
 Q2X1JOIQeY6kuweUgGZ7MmfnFdxzHX1U1HKtgryIxsfgyqjnErdoPR2k4qMpixPLlLox+URKS
 T3AxsyHj+AzM5XsbHSjiARobRDscjceH+PDV0zKLq3Lp4FKrwU0mjVncrUujlD/GXvfH6vaEO
 p1wW7qb3lm9rD+q+xSpPD1fAuekccmH4uvARAKLmIdrnOtu8JBYBR50iMjHa/4ZNFrgMUtlSR
 rAaIzK8gJWbq0RnXzA983HJzldOMQ7QnRghcxFENlloXGzmNXVSOD4m4jfSIqQia3z1e7ZjDF
 wwloqaLBi7GduRjTKZYYa/WkapODRurE+wSbjuC4mmS+faHyUfTHxJ/rWkWucmNKSUO78/v+e
 4Xt8HGxWvYtublESLQFmZpwdtfbjWVV+aS0OQjlrq1AZ2hXe8/ajT3lgiXv0E82JHqmrbzxEd
 DVBGZniQdAULnzJXZ9RuCk8i6eR/sgwQKuHrR7vAc8IeyDnQNAwpOxXGMXuEJ02Og7RzBMsM6
 QXZn3xop8chZsh7g3k0VFZfbSBhIBknqh/EnHeNHltrGxm/WdNAOguwZUfdXm+9RH0zbw5EXH
 IfCo/LZK9TiQChjtdFHwSW548lg=
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
Cc: alexander.deucher@amd.com, tim.huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

on an AMD Ryzen 5 PRO 4650U / Renoir (amdgpu: added device
1002:1636) I the screen basically freezes and I get the
following errors with kernel v6.3-rc4

[   26.214541] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *E=
RROR* IB test failed on gfx_low (-110).
[   26.379624] [drm] ring 0 timeout to preempt ib
[   27.387884] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *E=
RROR* IB test failed on gfx_high (-110).
[   27.392945] [drm:process_one_work] *ERROR* ib ring test failed (-110).
[   27.400370] amdgpu 0000:03:00.0: amdgpu: couldn't schedule ib on ring <=
gfx_low>
[   27.400384] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling
IBs (-22)
[   44.440532] amdgpu 0000:03:00.0: amdgpu: failed to write reg 28b4 wait =
reg 28c6
[   61.177118] amdgpu 0000:03:00.0: amdgpu: failed to write reg 1a6f4 wait=
 reg 1a706
[   61.189275] amdgpu 0000:03:00.0: amdgpu: couldn't schedule ib on ring <=
gfx_low>
[   61.189286] [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling
IBs (-22)

I bisected the issue, the first bad commit is
b589626674de94d977e81c99bf7905872b991197 reverting it on top
of v6.3-rc4 also fixes the issue.


Best regards,
Julian Wollrath

=2D-
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments
