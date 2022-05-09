Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78A520416
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 20:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5510F5DC;
	Mon,  9 May 2022 18:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222E010F5E7;
 Mon,  9 May 2022 18:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfKbnm2rlUBsIRyvgONV6OK9zm0wruOC8YiQgg6RAsNtcPldpZwQf4EeW8vaz+na+7EO894N+Jls3sY1q5y7u4Mui9BQllXPqjsLUBTZb6u/ZU14GWUbyofD10XeyfaifiErbFR/OQHl0zXFHTbXIVKkHUxrx5XadmvPhdOSf3QvDCakOBXkXF56gXV1O1yqGXmialnhrfSJi+xV/KYcABe0nPB8vRqWaQT8f+cNKHxUJ2KVAKWTPuOcnkcenvtAuNZmeUoF4eJZgAlJSYtTKA4qq0HCFzJRRmpXLIM/Pe/dCa4Y0AH7YJVXzYckMA4PQnxjVXOQadjX9LmqPYlyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKT27oAD/Onnnzhel72Ip9O5vf4Vhp4XhFpN23fNxVU=;
 b=L4OygjK2CjT/BTzdLkBiViOURMoblkGC3r0ZsxXMASjYMljAEf8DtKS7stU4tac7ZESfH5ddviuu8CC2bcvE2kwRQarQ1h3JM64E2YyklSjmyqSuZXN3p+xLLZEIrWQr1wd5xNF/iA1db7KIVvaddUQaxgrBG+pWWj15B4gMezj/y8KAXA9KpyRd02YjDXZZnfBBKSMhyap30bdRAIckyTXSIe+eOJKnnAVWzKMm927OAdZMWgc+BWANQOPEkdhPLaKdl0LFT1JfVkbad5Enm/+KmgZImjDyXiATiyRwWdwUFul56SiAJ+AVOH7oRhJ5xiNafv1RwGiqs47wLUbbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKT27oAD/Onnnzhel72Ip9O5vf4Vhp4XhFpN23fNxVU=;
 b=zlPph3Cui77WwFmyJqAN3/qcX3y286DetCRmP4C08YGJGi0HIkV5xexyYG+RU3F9/NO5s3HhdwwGcdXmsaKZIcV54PMy78qHv3rqwIfyBC3Bp3JkcYdd3Jn5/BWTSnYpMjAGbRXw44w0DkdcFj0UKFREH8lGJ4pF3/IcOwjH7Ro=
Received: from CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 18:03:02 +0000
Received: from CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::6dcc:2447:382c:32dc]) by CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::6dcc:2447:382c:32dc%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 18:03:02 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "bjorn@helgaas.com" <bjorn@helgaas.com>, Linux PCI
 <linux-pci@vger.kernel.org>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [Bug 215958] New: thunderbolt3 egpu cannot disconnect cleanly
Thread-Topic: [Bug 215958] New: thunderbolt3 egpu cannot disconnect cleanly
Thread-Index: AQHYY8EikSDGkcwMg0KIvHjY89dSnq0W1Tzw
Date: Mon, 9 May 2022 18:03:02 +0000
Message-ID: <CH0PR12MB513992A93F34197377A5315DF7C69@CH0PR12MB5139.namprd12.prod.outlook.com>
References: <bug-215958-41252@https.bugzilla.kernel.org/>
 <CABhMZUW4=XUOwFAE74nebnZcKBp5pwktWufHNBpB79t3iUeQ3A@mail.gmail.com>
In-Reply-To: <CABhMZUW4=XUOwFAE74nebnZcKBp5pwktWufHNBpB79t3iUeQ3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-05-09T17:58:30Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4dbe4d50-66c0-425a-b921-7db1baafc104;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-05-09T18:02:59Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 5ee36701-a95c-4bc1-b5ea-d27058105e72
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70e3fc7a-717f-4080-7333-08da31e628eb
x-ms-traffictypediagnostic: MN2PR12MB4549:EE_
x-microsoft-antispam-prvs: <MN2PR12MB454995F20EEDE6692E90D772F7C69@MN2PR12MB4549.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +wCEEYT/QXaKVsGWuphaDNgg/QltP5kltTM18U8O7M5PC1RJt4WFMG8C79osN2UdpW+30zJpOsraBGC0JpnC8QNcIi3mv/n+X3NY8wWoOPtsCtpQHPmBjAWXFgSQj0SNS1VEJQhoDdvpqBSiM6PRl0bccM9psP9XCbgK5LfH/70VTzLnFz05dvDZNhj4Fj3noHsYcFyhah3A0Asrmcg10s4qRB4dqGeifB5TRsFQcgesBGeNw+FQsoTrdaW0lHUGJOH9KmTN35vxhunBYSS64ODjrGS4aETRZ1Lsw7cvCXiepQ5pg2fmqITcRs9Xz+OmbnOveR4T7YRgnC+XB+TxhFaC+z04+wwpx4TbCqSxR7kE1Uohmlt+bFPrTfNsPMJlzx+cDonhrTjhbWUZRVZ1gWFMN55QaIJOQYjSglsOHgl94wr6LeFSwPa3cmlXbxli7aJ2JI02jzxZIodwYDmE4CZdj+rgJf0T3KTyRwFvmhp2HvVnkcCsZvRafWBV0G6xjJ6ga1sat4mBlbrLGY1MetMdQ51iFxGCjDttOXRky++CwvFeCam8gxN9uK1nI8fNiq2bmRCsogBC7FKRGaIiFvJGM0biXT3fkx46mLNPYe/c0OqgHCTSwajfbxbvbVAGGHHpCx1LwETaLSlrOGgK9GHlM51HpKvmGNfbfSb/UgLZLb28n2Q/6ro0cQefyO65JwhN1PpLMnfTmc4j9425j4+uN4Hzt9cYl2gdI9UHfGTbOsXI31PnR02yuw3UWUVAuuMGiyCB3mDCLBwDI4CCZlEiBfjJWLJJ7TVa+ggD+kM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(2906002)(52536014)(38070700005)(38100700002)(5660300002)(508600001)(186003)(4326008)(83380400001)(33656002)(45080400002)(66946007)(76116006)(8676002)(66476007)(66556008)(66446008)(64756008)(8936002)(54906003)(316002)(53546011)(110136005)(7696005)(6506007)(6636002)(26005)(9686003)(86362001)(71200400001)(966005)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QwvxACUJskqhP8pqz/nce4wEOEbefVwfdVM8YjiRnHPP0OcFJebTdQljjy+X?=
 =?us-ascii?Q?/PJxCHFx6Ixr/qk5boWsrZhdxjwY57juL5KfBK0yaX2VxK5zaYMrHdPToNi5?=
 =?us-ascii?Q?EeP2BivL/EWmD+zsMYXzNtPD5RF8mjPT8LyQigynhwcsCVpm1xkDjXVA2cDV?=
 =?us-ascii?Q?9Uf3tvz7uXMYjcQrqGkGHvk5XFrk8RhCKDoIrTaVmBOwcxgORzoavDLabIHa?=
 =?us-ascii?Q?uPsePYMxqoOpKF+z/ISc88MP4RN4oMSJvFHpqdu0aE6E2NsYLJPxPOuURDLm?=
 =?us-ascii?Q?4AyWbDOUNRpbtzvznKYhjmIk5oF3RhQLunUhF9HI4GHqVfkjcS5ie9JNKRmQ?=
 =?us-ascii?Q?9tz89XHMQMux4gTcOWlaEzp3MvQlB/JyNJY3ahK3a+KH2zeFd/qsT7X3TV/S?=
 =?us-ascii?Q?zNVK6waRnRsvCxGaJjbctE34AwP6j+S3gnBVB3m8dzuo8c1M9SnZ6gVEGjr7?=
 =?us-ascii?Q?2r4D6+ke3K9lw6qTf9zlVDyast4lxCyuRH4h7bF0wnv1pktYUOP0Z8qz11tv?=
 =?us-ascii?Q?AKc15Hj5I7lbAh/bFtoOxrMkALPvbPVPmtivWtGrBBA7G+2+9JbOvcM/Qx16?=
 =?us-ascii?Q?WiuAIroPtAED0smV7wbvTDDejIQ4Z566QUWuktSFVTB1Qbkwgqjekbu5G0gt?=
 =?us-ascii?Q?eem76iWL8siP4TbCj2KYa742O2Y5BMfRwptYsC76LhoTTfIN9fpWP2KA7jW2?=
 =?us-ascii?Q?QfwLlF4XQx4syUeqE3eImcnmUMXrEM+4p37v25YQCUt+dapxydHFI2Ik79Uz?=
 =?us-ascii?Q?sLqQSuBQA69Xi1woHZT/yFJEZrG5S4fjPBuXr/PeITJ3ZdLsme4RML/vSc4A?=
 =?us-ascii?Q?b5gDAjWhDOKsYLMQ4ThRNC3TLvjnwk0z+NxJGHySpcbhNK0njQzSdVSigCU2?=
 =?us-ascii?Q?TVKRY7IN/OGABp7KlS2c9LqVQSjt8SfC5l7HW8sdYaVmGTAQX+DDIYLjX9zv?=
 =?us-ascii?Q?yyAd2+UMblcczrAO83cIQcpBwppMyYSROxRCvG8Py5CCPkUNppW9pmIYyPs3?=
 =?us-ascii?Q?gZLyypumswI31L32otB1PiYPvggCeCHlx6cwkUQU1rmcrwBx/D5sLpSDff78?=
 =?us-ascii?Q?uoP44WBwj/WO02gKRA/Xpt1GKcd5lGpp4t3+ICn6ISzo/ZcttCV3ET3chCGG?=
 =?us-ascii?Q?hz4M+sm504jmEQzWcD8Kg3At5Wc9cuZRbDdIYWmW9hO8ta/DjCJNYdF9Fafn?=
 =?us-ascii?Q?0gKzm3v3EdYR1hWRn+CeBA4WfOwZakDvaX2Rw/cEa34Q7RMx91itv7iFaZjr?=
 =?us-ascii?Q?/WX3f+nQbXddxdOtQ0onVsh9NdR1YD768FjUaGXd3y014wMIdpvzYp6lbsL8?=
 =?us-ascii?Q?eAZ16WdgMdb+UXvgqDVFd5Ssmi3W2c09+9HkT1Ilb1ZfSbLTfwCJra+KcgsL?=
 =?us-ascii?Q?mq1uE57wg0E5Hcl5cHkUoPOIQmTOoXbCBMpE47OP7gYEwd7Ct7lb4PhrMYNu?=
 =?us-ascii?Q?uQ0kG01eeH0T/Jw4cVs/JNin0e/cS20E7ZP8IqYqhK8rnFsODpGmqD3ZG8Uk?=
 =?us-ascii?Q?5x0UuX6ljvrQTQmn85SYAnABnZwh6IsdVTOqCfZtZvfx9zqje2DHudS9s846?=
 =?us-ascii?Q?Csdn9IlYel0mXmCygsQdYJf+KqeYW6vIa/E7agtwA7A+tZz820XrwV4kQqXr?=
 =?us-ascii?Q?sCXvxDDzNkIYJJEkpvDvPIap6+0aYsbbPf9dnX44puazsbA2GrN9r+Lu2ZXg?=
 =?us-ascii?Q?GY+LeXntzMprqfdyjEWx3y/DFrxDGsX8jVJ9AfYPkWxl0PULS6ghV0N+xCpE?=
 =?us-ascii?Q?5fkwt5gfSg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e3fc7a-717f-4080-7333-08da31e628eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 18:03:02.4948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6BjlvculpCu7ho6aIGdkU1k6Kk6BSnz+/N9tQ9bUcpZ7q5Do0qrnyxN/aa38pHRuzYDEQTqeXABCVWh02sYNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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
Cc: "r087r70@yahoo.it" <r087r70@yahoo.it>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
> Sent: Monday, May 9, 2022 12:23 PM
> To: Linux PCI <linux-pci@vger.kernel.org>
> Cc: r087r70@yahoo.it; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; amd-gfx
> mailing list <amd-gfx@lists.freedesktop.org>; dri-devel <dri-
> devel@lists.freedesktop.org>
> Subject: Re: [Bug 215958] New: thunderbolt3 egpu cannot disconnect cleanl=
y
>=20
> On Sun, May 8, 2022 at 3:29 PM <bugzilla-daemon@kernel.org> wrote:
> >
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbug=
z
> >
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D215958&amp;data=3D05%7C01%7Cal
> exan
> >
> der.deucher%40amd.com%7C8bb8567427844b05e5f808da31d8435f%7C3d
> d8961fe48
> >
> 84e608e11a82d994e183d%7C0%7C0%7C637877102168668221%7CUnkno
> wn%7CTWFpbGZ
> >
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> 0%3
> >
> D%7C3000%7C%7C%7C&amp;sdata=3DPpcDBIpUW8vCX%2F4kM6Q8RjdgS1qw2
> uuWoWZXis4M
> > dDQ%3D&amp;reserved=3D0
> >
> >             Bug ID: 215958
> >            Summary: thunderbolt3 egpu cannot disconnect cleanly
> >            Product: Drivers
> >            Version: 2.5
> >     Kernel Version: 5.17.0-1003-oem #3-Ubuntu SMP PREEMPT
> >           Hardware: All
> >                 OS: Linux
> >               Tree: Mainline
> >             Status: NEW
> >           Severity: normal
> >           Priority: P1
> >          Component: PCI
> >           Assignee: drivers_pci@kernel-bugs.osdl.org
> >           Reporter: r087r70@yahoo.it
> >         Regression: No
>=20
> I assume this is not a regression, right?  If it is a regression, what pr=
evious
> kernel worked correctly?
>=20
> > I have an external egpu (Radeon 6600 RX) connected through
> > thunderbolt3 to my Thinkpad X1 carbon 6th Gen.. When I disconnect the
> > thunderbolt3 cable I get the following error in dmesg:
> >
> > [21874.194994] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.195006] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.195123] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.195129] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.195271] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.195276] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.195406] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.195411] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.195544] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:51 param:0x00000000 message:GetPptLimit?
> > [21874.195550] amdgpu 0000:0c:00.0: amdgpu:
> > [smu_v11_0_get_current_power_limit]
> > get PPT limit failed!
> > [21874.195582] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.195587] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.227454] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.227463] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.227532] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.227536] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.227618] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.227621] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.227700] amdgpu 0000:0c:00.0: amdgpu: SMU:
> response:0xFFFFFFFF
> > for
> > index:18 param:0x00000005 message:TransferTableSmu2Dram?
> > [21874.227703] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.227784] amdgpu 0000:0c:00.0: amdgpu:
> > [smu_v11_0_get_current_power_limit]
> > get PPT limit failed!
> > [21874.227804] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
> metrics table!
> > [21874.514661] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync
> register
> > 0x2f0d00. -5 [21874.568360] amdgpu 0000:0c:00.0: amdgpu: Failed to
> > switch to AC mode!
> > [21874.599292] amdgpu 0000:0c:00.0: amdgpu: Failed to switch to AC
> mode!
> > [21874.718562] amdgpu 0000:0c:00.0: amdgpu: amdgpu: finishing device.
> > [21878.722376] amdgpu: cp queue pipe 4 queue 0 preemption failed
> > [21878.722422] amdgpu 0000:0c:00.0: amdgpu: Failed to disable gfxoff!
> > [21879.134918] amdgpu 0000:0c:00.0: [drm:amdgpu_ring_test_helper
> > [amdgpu]]
> > *ERROR* ring kiq_2.1.0 test failed (-110) [21879.135144]
> > [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
> > [21879.338158] amdgpu 0000:0c:00.0: [drm:amdgpu_ring_test_helper
> > [amdgpu]]
> > *ERROR* ring kiq_2.1.0 test failed (-110) [21879.338402]
> > [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
> > [21879.543318] [drm:gfx_v10_0_cp_gfx_enable.isra.0 [amdgpu]] *ERROR*
> > failed to halt cp gfx [21879.544216] __smu_cmn_reg_print_error: 5
> > callbacks suppressed [21879.544220] amdgpu 0000:0c:00.0: amdgpu:
> SMU:
> > response:0xFFFFFFFF for
> > index:7 param:0x00000000 message:DisableAllSmuFeatures?
> > [21879.544226] amdgpu 0000:0c:00.0: amdgpu: Failed to disable smu
> features.
> > [21879.544230] amdgpu 0000:0c:00.0: amdgpu: Fail to disable dpm
> features!
> > [21879.544238] [drm] free PSP TMR buffer
>=20
> The above looks like what amdgpu would see when the GPU is no longer
> accessible (writes are dropped and reads return 0xffffffff).  It's possib=
le
> amdgpu could notice this and shut down more gracefully, but I don't think=
 it's
> the main problem here and it probably wouldn't force you to reboot.

+ Andrey who has been working on properly handling PCI hotplug on AMD GPUs.

>=20
> > [21880.455935] i915 0000:00:02.0: vgaarb: changed VGA decodes:
> > olddecodes=3Dnone,decodes=3Dio+mem:owns=3Dio+mem
> > [21880.456218] pci 0000:0c:00.0: Removing from iommu group 14
> > [21880.456715] pci 0000:0c:00.1: Removing from iommu group 14
> > [21880.456798] pci_bus 0000:0c: busn_res: [bus 0c] is released
> > [21880.456950] pci 0000:0b:00.0: Removing from iommu group 14
> > [21880.456985] pci_bus 0000:0b: busn_res: [bus 0b-0c] is released
> > [21880.457106] pci 0000:0a:00.0: Removing from iommu group 14
> > [21880.457156] pci_bus 0000:0a: busn_res: [bus 0a-0c] is released
> > [21880.457279] pci 0000:09:01.0: Removing from iommu group 14
> > [21880.457311] pci_bus 0000:09: busn_res: [bus 09-3a] is released
> > [21880.457543] pci 0000:08:00.0: Removing from iommu group 14
>=20
> This looks like removing 0c:00.0 (the GPU) and two switches leading to it
> (probably part of the Thunderbolt topology), so to be expected.
>=20

The GPU actually consists of multiple PCI devices, depending on the generat=
ion.  Back when HDMI audio became a thing, and audio endpoint was added. Th=
en more recently we added upstream and downstream PCI ports which connect t=
he GPU devices to the system.  On the GPU side of the ports is the GPU, aud=
io, and often USB and I2C (for UCSI).=20

> > [21880.457847] pci_bus 0000:06: Allocating resources [21880.457888]
> > pcieport 0000:06:02.0: bridge window [io  0x1000-0x0fff] to [bus 3b]
> > add_size 1000 [21880.457897] pcieport 0000:06:04.0: bridge window [io
> > 0x1000-0x0fff] to [bus 3c-6f] add_size 1000 [21880.457913] pcieport
> > 0000:06:02.0: BAR 13: no space for [io  size 0x1000] [21880.457919]
> > pcieport 0000:06:02.0: BAR 13: failed to assign [io  size 0x1000]
> > [21880.457924] pcieport 0000:06:04.0: BAR 13: no space for [io  size
> > 0x1000] [21880.457928] pcieport 0000:06:04.0: BAR 13: failed to assign
> > [io  size 0x1000] [21880.457934] pcieport 0000:06:04.0: BAR 13: no
> > space for [io  size 0x1000] [21880.457938] pcieport 0000:06:04.0: BAR
> > 13: failed to assign [io  size 0x1000] [21880.457943] pcieport
> > 0000:06:02.0: BAR 13: no space for [io  size 0x1000] [21880.457947]
> > pcieport 0000:06:02.0: BAR 13: failed to assign [io  size 0x1000]
>=20
> I'm not sure why we're allocating resources as part of the removal.
> The hierarchies under 06:02.0 (to [bus 3b]) and 06:04.0 (to [bus
> 3c-6f]) seem to be siblings of the hierarchy you just removed (my guess i=
s that
> was 06:01.0 to [bus 08-3a]).  But again, shouldn't require a reboot.
>=20
> > upon reconnection of the cable I get:
> >
> > [22192.753261] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as
> >
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
> .
> >
> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
> u
> > t98 [22192.753738] input: HDA ATI HDMI HDMI/DP,pcm=3D7 as
> >
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
> .
> >
> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
> u
> > t99 [22192.753952] input: HDA ATI HDMI HDMI/DP,pcm=3D8 as
> >
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
> .
> >
> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
> u
> > t100 [22192.755234] input: HDA ATI HDMI HDMI/DP,pcm=3D9 as
> >
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
> .
> >
> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
> u
> > t101 [22192.763885] input: HDA ATI HDMI HDMI/DP,pcm=3D10 as
> >
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
> .
> >
> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
> u
> > t102 [22192.975773] thunderbolt 0-1: new device found, vendor=3D0x127
> > device=3D0x1 [22192.975786] thunderbolt 0-1: Razer Core X
> >
> > but the egpu no longer appears in `xrandr --listproviders`. Full
> > reboot is needed.
>=20
> Can you please build with CONFIG_DYNAMIC_DEBUG=3Dy, boot with
> 'dyndbg=3D"file pciehp* +p"', and attach the complete dmesg log to the
> bugzilla?  Also please attach the complete "sudo lspci -vv" output (befor=
e the
> unplug and after the replug)?
