Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC82E3321
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 23:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03497892DE;
	Sun, 27 Dec 2020 22:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680079.outbound.protection.outlook.com [40.107.68.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D149892DE;
 Sun, 27 Dec 2020 22:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPIsfd/s0VxA/eQAiTG/k7sRPmQ0T6DOoz5kBlJ60JpgyDmfYeSfk2dd+yjz9PbNLqhtu87+FQePTfJllsqiPm6LTEieCAzLCOfzKJK8RMWwezr/+UTsQj8fH2/I0gToEqjP1vc0AozqxjdTQ+gtUML65VPaPBvJDT6tufIww6vYyGiiIAzINcLmGUoWt7VxGm/nxX5lqYOt7etmviBc1Gm7USh/HfzH0gce+Ed5D0d3y5DFgziDboQD0xoCYAh8IIkikX8HLnP01QnueD5Buwewf7gj3b8aW/TeWro0a8kGJXKgoC2LSABApbrwRuKBMRXW7dMR+l15Ec/SPZLgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcMzdM4hkvFco7ldIxy+eAoiZTptoYSy2UokWQbfHEA=;
 b=S7UiCmDuH4S/rgsSQTc+YsjOFG3wLvJpR7q9EA6mka+3f6nYrsxEKgXXm6zkkOd02jyLAKjM8UKFE0Ek8D1LsQEG1l7qzP0itua/5iBGySNx3JzZ0OIUwAelNH6louWO2yRLJT6GFA7cO6q80ni+LlgjnCSDLiL6heSAhQz/WX18Fi7as73vGhzgOfcvC76QsKmuKUAGJszRSFc/7TURQOBqxp53Kz5P29jjduZpeBPAE57/vBSIIyDfKin9S/saU+feVV75j+nJ9OHcAYCoEUzQmzyq3q2e31WiUIHGlFz21cvxhKArE6d1z3kYQ38N446d/zyxgElqFaKbMavWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcMzdM4hkvFco7ldIxy+eAoiZTptoYSy2UokWQbfHEA=;
 b=n7vXN+wT0SlquvWGrEVG6kQXRsdjNKLnoMx2zowLxpUPewIRWylkZey0dm3vDgc80PTprn8hbN1X6cSq4QELoRnWW52pfoHDQ0Kmp0nH/eSmYb1IjujO1FOQficWU2d22vpiVZKwDS1rcERXgQSe3ZdFoTmTC3W+3e9JbXXyIZ0=
Received: from DM6PR12MB3097.namprd12.prod.outlook.com (2603:10b6:5:11d::25)
 by DM5PR12MB1948.namprd12.prod.outlook.com (2603:10b6:3:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Sun, 27 Dec
 2020 22:29:54 +0000
Received: from DM6PR12MB3097.namprd12.prod.outlook.com
 ([fe80::4109:2abb:d4b0:b835]) by DM6PR12MB3097.namprd12.prod.outlook.com
 ([fe80::4109:2abb:d4b0:b835%7]) with mapi id 15.20.3700.031; Sun, 27 Dec 2020
 22:29:53 +0000
From: "Bridgman, John" <John.Bridgman@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, Linux List Kernel Mailing
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
Thread-Topic: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
Thread-Index: AQHW3G87f8XovBdTjUy+YtIPDk0L+6oLhDRb
Date: Sun, 27 Dec 2020 22:29:53 +0000
Message-ID: <DM6PR12MB30973924E8019A301E830BF0E8DA0@DM6PR12MB3097.namprd12.prod.outlook.com>
References: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>
In-Reply-To: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-12-27T22:29:52.410Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [72.139.202.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e75ea3c3-f4aa-4741-5cf0-08d8aab6eeba
x-ms-traffictypediagnostic: DM5PR12MB1948:
x-microsoft-antispam-prvs: <DM5PR12MB1948905C40A5296BD8DF675EE8DA0@DM5PR12MB1948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9UZbUcV0VgOS9zevI7EVxiq6z6TON1eo5U+eo+O/kZbPy4Df0TV35sJewBNGqZy7IFSTKGGVTR/ayAh4S0dqvHkiMZootG9+8DB+nKA+ARJs6rfDVt8o8ZIddAq5sg2A4uIh29UbRlHkM3K8MFWiMrXWClBKD0Z+n3XdKuxfYfQatDVlqvu4iXKoOx2bCK6R7pligDhfwKc2v3rajROy8MkIxiiE0zJp5ym9oB1WsQgKC25k/GelsYeAH+nDqo7vFCRpTAYvoZ7+4AyGOBjYJo6D0dd9gARfbNLqD/MjJdlPgzVTlFpm0iZJoyz2g3SeGIfmZREUDTG4LWomTOsmfOjhKf3bkTaOWhG0iO+WyBWS/Q9XyS62iPbGqjgzaMkMPqsU2tf3dHqVxHllLWBLMEgyUs2WxERDSDMHm8evbjJvavDbJl7yqbOShjVxoLGPLT4C64ymQsFJamdlXAZ+vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3097.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(26005)(186003)(66446008)(7696005)(86362001)(66946007)(91956017)(76116006)(52536014)(64756008)(66476007)(83380400001)(19627405001)(966005)(55016002)(6506007)(66556008)(8936002)(8676002)(110136005)(316002)(53546011)(45080400002)(478600001)(5660300002)(9686003)(2906002)(33656002)(71200400001)(166002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?a2bW6410TLplU04ZOcthI3kMPsx9dxa1GYSLAnr35fInueHALKh52JGWLw?=
 =?iso-8859-1?Q?RsumrC6cvFrLuE6Tdp0NfmbcMhm2Kf9uhfx8ew4sZz/vlMHmxdRMWLfgEI?=
 =?iso-8859-1?Q?rCzxa8o/mjSJl/1yJ18VqfOEM/++JO4/6i18KMlem1MYwsvrdYsE/B3JgQ?=
 =?iso-8859-1?Q?1v5jYX8QzCx7oMUuzqVZ5i3HLFfcnPWR6N7xqbCsDHEBd1qv41RpWblm/1?=
 =?iso-8859-1?Q?oD642VHDrYtR/yKc/1G/oAI8XU10Q8LRQbXDpo2/wT9gZXE7Ox2ZZvinNz?=
 =?iso-8859-1?Q?UROrihkWUmHb5ulNR6tP+gzS3f0XC3UfybFOZgt0FjwQPepWsE4bkAY1rm?=
 =?iso-8859-1?Q?966hLkH1QiY5pUKlz0vEz9kwV3PNfEYWc4LgplnrxeEStva9meGPwHX9zQ?=
 =?iso-8859-1?Q?0y098k7U5E8n1JDeIinh2HO3e42izKIpJHZlWpGw1J1vT+w/ehdC/M+EO7?=
 =?iso-8859-1?Q?dmp1ZuSjdk9JCUCeeXnmY6qSniTCXSxebzMJdfngygd4hycc+y0JkGl/x6?=
 =?iso-8859-1?Q?6JR/qBIcypieUSQQErubsi6myI4i2k89q8E7WxVtlMo091szzLnlLghBOK?=
 =?iso-8859-1?Q?m+FUsSHqZFGduQwjtPIXck6OlP9enknBjdApTh1FUL1heohWpvWfcrrKt6?=
 =?iso-8859-1?Q?Tj5KGM69lcrVJjmbwRNG/U//fU4YjoqUvbwpBGmMqwe+bbS69MusWrkfdl?=
 =?iso-8859-1?Q?2XEOpSzLjrCUJF4l31NT92fVCIWaUm0galY7EIqUBs8APbcC512vVe0C2q?=
 =?iso-8859-1?Q?/T4krcU3xqBcpK5LNcDvGs0Cp1LpWQufFYLe1eynRHuPcwZB1aNKAggAlJ?=
 =?iso-8859-1?Q?VaQMH/XeRJNq+oXLAKsOJ4rXMyWOvDFvUpE4EVS+sa4hK0Uh7MJhkRjoRT?=
 =?iso-8859-1?Q?tL7DCxuhmMLikCl2/rjq7EplJvuMRKhteWYYN6x++79WR5aU6YdGuigSuL?=
 =?iso-8859-1?Q?a0W5ShNrc7RgNPEy08OeI+tVJjncv9Jln7qTngnKynkeYb0c7vDe+Cby7A?=
 =?iso-8859-1?Q?iUE7GMDZcydNnGveo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3097.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75ea3c3-f4aa-4741-5cf0-08d8aab6eeba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2020 22:29:53.7436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ftLP3ehqT0KQVcwA9ZBlx6w1ARlvPnsw7JFcs9jpoYiHpe5bw2U6EmOMQl+Xykzsgo88CDLF8/biwrnZFAIBbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1948
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
Content-Type: multipart/mixed; boundary="===============1557777347=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1557777347==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB30973924E8019A301E830BF0E8DA0DM6PR12MB3097namp_"

--_000_DM6PR12MB30973924E8019A301E830BF0E8DA0DM6PR12MB3097namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

If you want to pick up the firmware directly it is maintained at...

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/tree/amdgpu


-rw-r--r-- sienna_cichlid_ce.bin 263296   logstatsplain
-rw-r--r-- sienna_cichlid_dmcub.bin 80244 logstatsplain
-rw-r--r-- sienna_cichlid_me.bin 263424   logstatsplain
-rw-r--r-- sienna_cichlid_mec.bin 268592  logstatsplain
-rw-r--r-- sienna_cichlid_mec2.bin 268592 logstatsplain
-rw-r--r-- sienna_cichlid_pfp.bin 263424  logstatsplain
-rw-r--r-- sienna_cichlid_rlc.bin 128592  logstatsplain
-rw-r--r-- sienna_cichlid_sdma.bin 34048  logstatsplain
-rw-r--r-- sienna_cichlid_smc.bin 247396  logstatsplain
-rw-r--r-- sienna_cichlid_sos.bin 215152  logstatsplain
-rw-r--r-- sienna_cichlid_ta.bin 333568   logstatsplain
-rw-r--r-- sienna_cichlid_vcn.bin 504224  logstatsplain

My understanding was that the firmware was also added to Fedora back in Nov=
ember but I'm having a tough time finding confirmation of that.


________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Mikhail =
Gavrilov <mikhail.v.gavrilov@gmail.com>
Sent: December 27, 2020 11:39 AM
To: amd-gfx list <amd-gfx@lists.freedesktop.org>; Linux List Kernel Mailing=
 <linux-kernel@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org=
>
Subject: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10

Hi folks.
I bought myself a gift a new AMD 6900 XT graphics card to replace the
AMD Radeon VII.
But all joy was overshadowed that this video card did not working in Linux.
Output on the my boot screen was ended with message "fb0: switching to
amdgpudrmfb from EFI VGA" and videocard not switched to graphic mode.
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fphotos.=
app.goo.gl%2FzwpErNrusq9CNyES7&amp;data=3D04%7C01%7Cjohn.bridgman%40amd.com=
%7C37ba164fc80241451b9808d8aa864aa2%7C3dd8961fe4884e608e11a82d994e183d%7C0%=
7C0%7C637446841356919588%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DY3V3lbEaXNwHiak=
gRUAeO7gBJASeElBaIwZ9Vmd0AgU%3D&amp;reserved=3D0

I suppose the root of cause my problem here:

[    3.961326] amdgpu 0000:0b:00.0: Direct firmware load for
amdgpu/sienna_cichlid_sos.bin failed with error -2
[    3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to init sos firmware
[    3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Failed to load psp firmwa=
re!
[    3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init
of IP block <psp> failed -2
[    3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_device_ip_init failed
[    3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error during GPU init
[    3.961911] amdgpu: probe of 0000:0b:00.0 failed with error -2

Can anybody here help me get firmware?
my distro: Fedora Rawhide
kernel: 5.10 rc6
mesa: from git 21.0.0 devel

Sorry for disturb and merry xmas.


--
Best Regards,
Mike Gavrilov.

--_000_DM6PR12MB30973924E8019A301E830BF0E8DA0DM6PR12MB3097namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>If you want to pick up the firmware directly it is maintained at...
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/tree/amdgpu">https://git.kernel.org/pub/scm/linux/kernel/git/fi=
rmware/linux-firmware.git/tree/amdgpu</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Courier New&quot;, monospace; font-size: =
11pt;">-rw-r--r-- sienna_cichlid_ce.bin 263296&nbsp;&nbsp; logstatsplain</s=
pan>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_dmcub.bin 80244 logstatsplain</span><=
/div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_me.bin 263424 &nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_mec.bin 268592&nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_mec2.bin 268592 logstatsplain</span><=
/div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_pfp.bin 263424&nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_rlc.bin 128592&nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_sdma.bin 34048&nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_smc.bin 247396&nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_sos.bin 215152&nbsp; logstatsplain</s=
pan></div>
<div><span style=3D"font-family: &quot;Courier New&quot;, monospace; font-s=
ize: 11pt;">-rw-r--r-- sienna_cichlid_ta.bin 333568&nbsp;&nbsp; logstatspla=
in</span></div>
<span style=3D"font-family: &quot;Courier New&quot;, monospace; font-size: =
11pt;">-rw-r--r-- sienna_cichlid_vcn.bin 504224&nbsp; logstatsplain</span><=
br>
</div>
<div><br>
</div>
<div>My understanding was that the firmware was also added to Fedora back i=
n November but I'm having a tough time finding confirmation of that.<br>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"font-size:12pt"><br>
</div>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Mikhail Gavrilov &lt;mikhai=
l.v.gavrilov@gmail.com&gt;<br>
<b>Sent:</b> December 27, 2020 11:39 AM<br>
<b>To:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Linux List K=
ernel Mailing &lt;linux-kernel@vger.kernel.org&gt;; dri-devel &lt;dri-devel=
@lists.freedesktop.org&gt;<br>
<b>Subject:</b> [bug] Radeon 3900XT not switch to graphic mode on kernel 5.=
10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi folks.<br>
I bought myself a gift a new AMD 6900 XT graphics card to replace the<br>
AMD Radeon VII.<br>
But all joy was overshadowed that this video card did not working in Linux.=
<br>
Output on the my boot screen was ended with message &quot;fb0: switching to=
<br>
amdgpudrmfb from EFI VGA&quot; and videocard not switched to graphic mode.<=
br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fphotos.app.goo.gl%2FzwpErNrusq9CNyES7&amp;amp;data=3D04%7C01%7Cjohn.bri=
dgman%40amd.com%7C37ba164fc80241451b9808d8aa864aa2%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637446841356919588%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdat=
a=3DY3V3lbEaXNwHiakgRUAeO7gBJASeElBaIwZ9Vmd0AgU%3D&amp;amp;reserved=3D0">ht=
tps://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fphotos.ap=
p.goo.gl%2FzwpErNrusq9CNyES7&amp;amp;data=3D04%7C01%7Cjohn.bridgman%40amd.c=
om%7C37ba164fc80241451b9808d8aa864aa2%7C3dd8961fe4884e608e11a82d994e183d%7C=
0%7C0%7C637446841356919588%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DY3V3lbEaX=
NwHiakgRUAeO7gBJASeElBaIwZ9Vmd0AgU%3D&amp;amp;reserved=3D0</a><br>
<br>
I suppose the root of cause my problem here:<br>
<br>
[&nbsp;&nbsp;&nbsp; 3.961326] amdgpu 0000:0b:00.0: Direct firmware load for=
<br>
amdgpu/sienna_cichlid_sos.bin failed with error -2<br>
[&nbsp;&nbsp;&nbsp; 3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to init s=
os firmware<br>
[&nbsp;&nbsp;&nbsp; 3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Failed to =
load psp firmware!<br>
[&nbsp;&nbsp;&nbsp; 3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR=
* sw_init<br>
of IP block &lt;psp&gt; failed -2<br>
[&nbsp;&nbsp;&nbsp; 3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_device_ip=
_init failed<br>
[&nbsp;&nbsp;&nbsp; 3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error duri=
ng GPU init<br>
[&nbsp;&nbsp;&nbsp; 3.961911] amdgpu: probe of 0000:0b:00.0 failed with err=
or -2<br>
<br>
Can anybody here help me get firmware?<br>
my distro: Fedora Rawhide<br>
kernel: 5.10 rc6<br>
mesa: from git 21.0.0 devel<br>
<br>
Sorry for disturb and merry xmas.<br>
<br>
<br>
--<br>
Best Regards,<br>
Mike Gavrilov.<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB30973924E8019A301E830BF0E8DA0DM6PR12MB3097namp_--

--===============1557777347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1557777347==--
