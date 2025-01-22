Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE46A19581
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 16:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E9E10E241;
	Wed, 22 Jan 2025 15:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.fr header.i=@yahoo.fr header.b="mG/yqXtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
 (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BACD10E2AA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s2048;
 t=1737560542; bh=Br03VX5xQjchNoE3dMHDys6lZnQLxgRZfB2rw4Ig/Ws=;
 h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To;
 b=mG/yqXtuMKbXVkPfCcI7Eeo2TTS8BRFhyuAz7PwdJVFI5xDH8OK0aiSuRkRAG2qBvOgLnV0QUdLjNYh715yg+M2FU/m9Oe6hU5ryzoGeV7ne87CeYSx88maLFVF/gsVZy1e1B7Z8QBZnJISYee7VFogciApRAteQNpQHd/qCheAFe9l6bxlMqF2CCKcesJLWPuA8cB6HWLaMfqX7tq01UO8z8w9wSzffpH9kfqEli1nEvvqX/4KiHcP2lA3cyCNJ0Y4s97EHim8wpC/+hFp7gnXEcGJAed4NPVeEFZ162ezU5FNHy1skpg7stGGrFDP0gSu1gSUa7bnso7ZOhSoHvg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1737560542; bh=3kNg/edWc6KNr4cgJKjVqA+pnCfz//8SewkiTIRKdND=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=FEDX6hsG3+wQShuZG+y9qHufmEfLgJiGmGxhoxC1dLRf4PkirZhSMQHvPyfnPqX07o7FlHZujXdUEpGI3+VsSUOw6pGTpHcA3khQ1i6JTgMzcJfOmPhDmh2IDoIYhKReU/mC9OK71NdEz+M1cTlorTzsJAMP+wCqqQZZIb9MoFsPPbP9vLvTFrDoBthQ/VWLMyxsNmKojomMmkWBN7AtXTJYbD8O/1V7pvTeO4BPjvyCY15qbKT2LN4qB4GwubqrZRIjiebg6nLQfhyfzxypJ+MPb6yvwrHHnt+OpjTxtSbye4skcYssbjtr1WA2U5EyNIUbAlL+MYDmxhcfuQFU/Q==
X-YMail-OSG: 1KqRKbwVM1lPiRnMDRX8t7d2IfSwxyiLvsM9Ovm3bXx33H9eQIXr755Iw_HuL0g
 qtg7CR_YNuX1eM7V3zFqYtn9uudJ6vS3kWMIq93nDo8LQy0g1vfNzLXf1PhJd0SujrV5sszwrs0P
 k6z9np601KqDyWI4X._Mr_aT2H_0iGic8VkZgekwnP.LXM1qnZ91Br.FmEsdGRKqQ.dStGYrPjv0
 EjBCQGGbnscEmNcGvJHfQLlg3w5kjCicOtFNVV9HI.5LYDbGraDYC6RMH8axbYevtXGCeTOVrIOy
 dHBgcbQu3bNsx9LLPTaF5APkiGXxB3gniIyCb9e_IaHzEdYLluFBmncSQzPEPf.qtSq7_nr4hVmT
 uyr9TJOajHo1csnIwhXnbIPP15vGLQ3MSdfR01BqwbIhN4hRmQsvE_2KSZ9uAXJwsX8T9uF3JJHV
 WgU2ucgVn.r0I32ToBdyK_e2a7ANGKLEK.mUXDaTaiUVkDnWkY6oZMZ_jUsyYdG58DJGA5Zik4nz
 9XBYmKrX3TPfLZJ3CN71to5s9H_cwU_3OV8obYY8Re58agPitU3OB3or28hucDjZikuMIVO30WGn
 U0e.ARxhsGyibY3xuFZqnqYGjep5cUcvjB8fPin2vLLnlA0VMIrdW7bryQd6pfbkALuo3ub2nOau
 2olc.IM2._fi5vcdtOZogy6E2ik6H6TKGgGnX.4n5MmmAni5xnmtmdBRy2nQ4_lRMwwLqB3MW6FV
 0U1ccbCIVqflhXh_kcJibtrZIgy1l4ta_dZFROvJOD3ICAdsNtZSfmGPurW8eeJK3Q3AGZHsUwjh
 knEgWXqgKk_qkudLSboBrxGJCI3SRTPmiu1biHCc0JauZ.yh39E6Q0qAi_1iFvGCnpWivIbQiK95
 rsuj7kIASiGr16a9YRVsEOEYTkHAZHz0sMHehqtnp_zQqx8ahYWSXI5VX4kuDiObbLglXGCEzt5h
 KejrzrYrfJTeI08UBxG25.kl_JVaSLg3IIZgI_Q6nQyT1bDlZU1ZA9NKzWIwbB57NfvuJjye.Nf_
 P8l_htwXV2w7jQHq1jZoM9ZhXD2jxWYT43yhomMgtnKPVIT81fIiFCZlPaFutEKZgbtirEWValx3
 OEwp142K9GV2XIX4jt6xKkHOR1zp4XXy5lFCxnNwWbDrKTWycH5yxQuUUmR9X5.oXbPVhAKF5WGf
 cUHbQ_AdKJUoSrdUNTm370bUaltLNssxwoU.635zXYBifvE.UH4y0w8F4s96heb5VOppyKdcImo3
 ubVndib821R..HBKxP9ee3.4xpjdL176NvjkN.d6G.z.1CsQWRBjqah9iZUq0tbz9F9p1TW2.6q0
 3cOUYmbwrLg38VfE9KEkppqYi8PMWle9cuTMaC8U_8BePtyCekZGL4KENBhEjUz1a.e3PJMyyv2D
 tBU64HktZ_pWvTs_3guZ.f77dJrBGUcCS57MAV2QjFqJ4QqM.h0tBa4rDYswD0Pj8876vUZ5SHQz
 eWejrClUraFZuWxpLLhleZ.DUf1roZtLuevzRRWCfG2yuUGX1sJKFz4876EDpIm9Ekxj4cUkwSRO
 T._AmlCWdKvBmH_zA5aVKxfOKM6wQiKSBdFH6cikcR.HWo2.VmM3V2PNEGdc7N_apXwfZQXeDPwU
 9hdD09dC2It9cSfFbQK9F9RMO6UVy.bT5terM70qtKvBuM_7DbiOrAILHgDHUgWh3Hywgr6zXCdc
 Mc_oEw6.O2Bbj.o.UAomnD1za8pdLG4iUMPuQiliBLQQN_r1Sh42_fnQS5QrLwYngaXE9uzC4wzv
 _MAzJO5tKjVOYbCV.X118xu4bQSaOOHmMdEAOsvQybwBnkIQeMdvkKDLeGQn.Hh_idFEZ3cLXKUA
 o9CjG7mRRzl9h5PitDpayoEsglRrBkTJpsAK7NUntqJkJa2l0vwHhD.8dfv_TDIJe8YnS90NwCZs
 Sj.wBX25YCKvkGD5sZAjqNAC2JCPmzaf095v3w8ZoYuu4omI7aK1CgXYKsR3l6owN64A6gnoDEEA
 1T4YLga8XFs6MZotyO8mt3bpXgXpsEGDbTfV3A8jUkUa2ewcXR6wUnCyzqvCwOJbgkJ3zNuA7.K9
 m37sROJGCXIddEE6f6JolDil4nJqSwSo8X5IiB8cxsF2GT4qYnSW9rcRogQUeVcQUN..X9p5S2E.
 SBKszo95owmazTZDQefTlvRl46Uu.7CFk.03XkOZbc7uhm094qTL6qKA6t6cz8UHRQgzPVM3rylv
 SGcdENenGb.Hgyvc43Wxkj_SJIurfqButf_aSui6cy_mC_wpnp6Zg3WPRVe.KPr8-
X-Sonic-MF: <robert.dazi@yahoo.fr>
X-Sonic-ID: 90d0ed21-0540-498d-9146-3f33889a710c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Wed, 22 Jan 2025 15:42:22 +0000
Date: Wed, 22 Jan 2025 15:42:21 +0000 (UTC)
From: "robert.dazi@yahoo.fr" <robert.dazi@yahoo.fr>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "Sharma, Shashank" <shashank.sharma@amd.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, 
 "Pichika, UdayKiran (Uday Kiran)" <udaykiran.pichika@amd.com>, 
 "PV, SRIHARSHA" <sriharsha.pv@amd.com>, 
 "Swarnakar, Praful" <praful.swarnakar@amd.com>, 
 "Wentland, Harry" <harry.wentland@amd.com>
Message-ID: <1857969400.5366816.1737560541442@mail.yahoo.com>
Subject: Re: Introducing AMDGPU Composition Stack (ACS)
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_5366815_1111065023.1737560541440"
References: <1857969400.5366816.1737560541442.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23187 YMailNoble
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

------=_Part_5366815_1111065023.1737560541440
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Hello,
Do you plan to migrate some of the GPU-Open repos to this Gitlab org ? Or i=
s it for a very distant future as the priority for the next years is on Way=
land AMD-specific optimisations/interfaces/protocols ? (or give in to the s=
econd principle of thermodynamics :D )
    Le mercredi 22 janvier 2025 =C3=A0 15:53:48 UTC+1, Sharma, Shashank <sh=
ashank.sharma@amd.com> a =C3=A9crit : =20
=20
 =20
[AMD Official Use Only - AMD Internal Distribution Only]


Introducing AMDGPU Composition Stack (ACS).ACS is simply AMD's fork of West=
on compositor, with some additional advanced features. We have created ACS =
considering the following primary goals in mind:  =20
   - To act as a staging area for Wayland features to be open-sourced to ma=
inline Weston project.
   - To act as a reference compositor for AMD's advanced graphics and displ=
ay feature development.
   - To provide a middleware compositor which extracts the best out of AMD =
Display and Graphics HW (We don't mind being biased to AMDGPU HW =F0=9F=99=
=82)
  =20
   - To host some of the AMD HW specific code, which can't be merged in Wes=
ton mainline due to its bias towards AMD HW.
  =20
   - To be utilised in full stack opensource delivery vehicle for AMDs comm=
ercial solutions and products.
   - To be the space where AMD specific in-house SW tools (performance twea=
kers, multimedia players, 3D games, profiling tools etc) can be saved in fu=
ture.
ACS project is hosted here:=C2=A0https://gitlab.com/acs-wayland=C2=A0
A detailed wiki of introduction to ACS, its features and feature roadmap ca=
n be found here:https://gitlab.com/acs-wayland/weston/-/wikis/home=C2=A0
The details about additional features implemented in ACS are documented her=
e:https://gitlab.com/acs-wayland/weston/-/wikis/home/ACS-Features
PS: We are yet to deploy a CI/CD build for ACS project.
RegardsShashank Sharma =20
------=_Part_5366815_1111065023.1737560541440
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div id=3D=
"yiv4072483421"><div><div style=3D"font-family:Helvetica Neue, Helvetica, A=
rial, sans-serif;font-size:16px;" class=3D"yiv4072483421ydp18c84724yahoo-st=
yle-wrap"><div id=3D"yiv4072483421ydp18c84724yiv3108795658"><div><div style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa5810272yahoo-style-wra=
p"><div></div>
        <div>Hello,</div><div><br clear=3D"none"></div><div>Do you plan to =
migrate some of the GPU-Open repos to this Gitlab org ? Or is it for a very=
 distant future as the priority for the next years is on Wayland AMD-specif=
ic optimisations/interfaces/protocols ? (or give in to the second principle=
 of thermodynamics :D )</div><div><br clear=3D"none"></div>
       =20
        <div id=3D"yiv4072483421yqt21786" class=3D"yiv4072483421yqt49116643=
26"><div id=3D"yiv4072483421ydp18c84724yiv3108795658yqt90293" class=3D"yiv4=
072483421ydp18c84724yiv3108795658yqt8266087676"><div id=3D"yiv4072483421ydp=
18c84724yiv3108795658ydpa5810272yahoo_quoted_7900599705" class=3D"yiv407248=
3421ydp18c84724yiv3108795658ydpa5810272yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                        Le mercredi 22 janvier 2025 =C3=A0 15:53:48 UTC+1, =
Sharma, Shashank &lt;shashank.sharma@amd.com&gt; a =C3=A9crit :
                    </div>
                    <div><br clear=3D"none"></div>
                    <div><br clear=3D"none"></div>
               =20
               =20
                <div><div id=3D"yiv4072483421ydp18c84724yiv3108795658ydpa58=
10272yiv5670622063">

=20


<div dir=3D"ltr">
<p align=3D"Left" style=3D"font-family:Calibri;font-size:10pt;color:#0000FF=
;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;">
[AMD Official Use Only - AMD Internal Distribution Only]<br clear=3D"none">
</p>
<br clear=3D"none">
<div>
<div style=3D"direction:ltr;margin-top:1em;margin-bottom:1em;font-family:Ap=
tos, Calibri, Helvetica, sans-serif;font-size:11pt;color:rgb(0, 0, 0);" cla=
ss=3D"yiv4072483421ydp18c84724yiv3108795658ydpa5810272yiv5670622063elementT=
oProof">
Introducing AMDGPU Composition Stack (ACS).</div>
<div style=3D"direction:ltr;margin-top:1em;margin-bottom:1em;font-family:Ap=
tos, Calibri, Helvetica, sans-serif;font-size:11pt;color:rgb(0, 0, 0);" cla=
ss=3D"yiv4072483421ydp18c84724yiv3108795658ydpa5810272yiv5670622063elementT=
oProof">
ACS is simply AMD's fork of Weston compositor, with some additional advance=
d features. We have created ACS considering the following primary goals in =
mind:</div>
<ul style=3D"direction:ltr;"><li style=3D"font-family:Aptos, Calibri, Helve=
tica, sans-serif;font-size:11pt;color:rgb(0, 0, 0);">
To act as a staging area for Wayland features to be open-sourced to mainlin=
e Weston project.</li><li style=3D"font-family:Aptos, Calibri, Helvetica, s=
ans-serif;font-size:11pt;color:rgb(0, 0, 0);">
To act as a reference compositor for AMD's advanced graphics and display fe=
ature development.</li><li style=3D"font-family:Aptos, Calibri, Helvetica, =
sans-serif;font-size:11pt;color:rgb(0, 0, 0);">
To provide a middleware compositor which extracts the best out of AMD Displ=
ay and Graphics HW (We don't mind being biased to AMDGPU HW =F0=9F=99=82)
</li><ul><li style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;fon=
t-size:11pt;color:rgb(0, 0, 0);">
To host some of the AMD HW specific code, which can't be merged in Weston m=
ainline due to its bias towards AMD HW.</li></ul><li style=3D"font-family:A=
ptos, Calibri, Helvetica, sans-serif;font-size:11pt;color:rgb(0, 0, 0);">
To be utilised in full stack opensource delivery vehicle for AMDs commercia=
l solutions and products.</li><li style=3D"font-family:Aptos, Calibri, Helv=
etica, sans-serif;font-size:11pt;color:rgb(0, 0, 0);">
<div class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa5810272yiv5670622063=
elementToProof">To be the space where AMD specific in-house SW tools (perfo=
rmance tweakers, multimedia players, 3D games, profiling tools etc) can be =
saved in future.</div>
</li></ul>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
ACS project is hosted here:&nbsp;</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<a rel=3D"nofollow noopener noreferrer" shape=3D"rect" id=3D"yiv4072483421y=
dp18c84724yiv3108795658ydpa5810272yiv5670622063LPlnk583319" target=3D"_blan=
k" href=3D"https://gitlab.com/acs-wayland" class=3D"yiv4072483421ydp18c8472=
4yiv3108795658ydpa5810272yiv5670622063OWAAutoLink">https://gitlab.com/acs-w=
ayland</a>&nbsp;</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<br clear=3D"none">
</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
A detailed wiki of introduction to ACS, its features and feature roadmap ca=
n be found here:</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<a rel=3D"nofollow noopener noreferrer" shape=3D"rect" id=3D"yiv4072483421y=
dp18c84724yiv3108795658ydpa5810272yiv5670622063LPlnk407479" target=3D"_blan=
k" href=3D"https://gitlab.com/acs-wayland/weston/-/wikis/home" class=3D"yiv=
4072483421ydp18c84724yiv3108795658ydpa5810272yiv5670622063OWAAutoLink">http=
s://gitlab.com/acs-wayland/weston/-/wikis/home</a>&nbsp;</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<br clear=3D"none">
</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
The details about additional features implemented in ACS are documented her=
e:</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<a rel=3D"nofollow noopener noreferrer" shape=3D"rect" id=3D"yiv4072483421y=
dp18c84724yiv3108795658ydpa5810272yiv5670622063LPlnk100398" target=3D"_blan=
k" href=3D"https://gitlab.com/acs-wayland/weston/-/wikis/home/ACS-Features"=
 class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa5810272yiv5670622063OWAA=
utoLink">https://gitlab.com/acs-wayland/weston/-/wikis/home/ACS-Features</a=
></div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<br clear=3D"none">
</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
PS: We are yet to deploy a CI/CD build for ACS project.</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
<br clear=3D"none">
</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
Regards</div>
<div style=3D"font-family:Aptos, Calibri, Helvetica, sans-serif;font-size:1=
1pt;color:rgb(0, 0, 0);" class=3D"yiv4072483421ydp18c84724yiv3108795658ydpa=
5810272yiv5670622063elementToProof">
Shashank Sharma</div>
</div>
</div>

</div></div>
            </div>
        </div></div></div></div></div></div></div></div></div></div></body>=
</html>
------=_Part_5366815_1111065023.1737560541440--
