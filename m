Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C12E727A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 18:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E135189301;
	Tue, 29 Dec 2020 17:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284B389301
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 17:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXWf8AwnCpH14cn1AJ4UKiGdqTSLhw5eEfPYfR80BLFcHdvbam1A1a2R6BPuDYXhKZp/w2whRAA+LHzpE5hysRv1b39+xWTyHDnLjl/F8+zXZIzMXpRlPtORo0rldlNDfesu9LGmflx8rJ4CsRVatjc64JnoLUcrtEGv3fqsKJo/TVlS1FSrpyrwBEul/W0N0MYbONV6Oyv/G5NMMfy/DwPuWB+WzYTIOPyY2Po1biC7x4cIPFyx1NqP4AW+o9tR6SR8z93ZLD5CzNBCbHogr7cOXovahdQkn8ssYfmYcfAP0uyUCUflCJAq/o5svjfEVX7hRNhmb50Dly9RgqJwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIhAlca64R+zf73j61sluEQ7CNSID3Ve1vQ+Cv4fCg=;
 b=j4mQiHjKdCqqXoADn+1V5ivD/Axb9X7zAPmu8zhz0rirbjl+xh0xN11UR5EJfag/Gl5MAsI6n7u+mK25kxfP2IOJptaDpCYJWUBkG0avQDfwjbLIP7J0lCr/C/3+xAgp4Ij5YIqr14He762uIsa0XsF3yIRucCebc1d2xW6KbAXzeDRt66zlrWSuMiyA2+DrOOlOid2Ch+9JGu9izq4Bd3e/1rnWrHWdFm5k6skPSb8NdElKvv30G5DwnBe0I7L90aU2EbRaJF9ho33KVx+CnbxenrSnr6DG0mqPMAX02D8m1nXBifyRMWjFXKNTVYwM3Iv+JgUJUwpJ3aQC+XOoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIhAlca64R+zf73j61sluEQ7CNSID3Ve1vQ+Cv4fCg=;
 b=uoV2x1j22iGkqNm8kvCKe9odToozRsQqSXuj1BhYyo7meQqHgGOeiEwsFdy1J04HXW35nmnb68LzYD/bY5EO3qXtizpOfQaCuh/NhMqWelsW7YSqKoJISabH4cr7XVBgjyN1TrmV0quxUX1GL2sCiILr4EUOYVK/5UAzYX4WuOs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3781.namprd12.prod.outlook.com (2603:10b6:610:27::11)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.29; Tue, 29 Dec
 2020 17:01:22 +0000
Received: from CH2PR12MB3781.namprd12.prod.outlook.com
 ([fe80::3d50:f4c3:fb52:cc93]) by CH2PR12MB3781.namprd12.prod.outlook.com
 ([fe80::3d50:f4c3:fb52:cc93%3]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 17:01:22 +0000
Date: Tue, 29 Dec 2020 12:01:19 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [git pull] drm fixes for 5.11-rc1
Message-ID: <20201229170119.qggf2suscm7ihu34@outlook.office365.com>
References: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
 <CAHk-=whf+kw=YSDbmvgiSvNL9ckHc8EpkTgZzMXu-bMw941GYQ@mail.gmail.com>
 <CADnq5_N_2iYnh13p-z5vrvNK9rzKV-5TYtCC-FiEYjvi--_org@mail.gmail.com>
 <DM6PR12MB42679D211553881EB5F1A8FDF5D80@DM6PR12MB4267.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB42679D211553881EB5F1A8FDF5D80@DM6PR12MB4267.namprd12.prod.outlook.com>
X-Originating-IP: [2607:fea8:56e0:6d60:f639:9ff:fe01:4714]
X-ClientProxiedBy: YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::17) To CH2PR12MB3781.namprd12.prod.outlook.com
 (2603:10b6:610:27::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:f639:9ff:fe01:4714)
 by YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Tue, 29 Dec 2020 17:01:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69e22631-ec8d-42e2-affb-08d8ac1b5e91
X-MS-TrafficTypeDiagnostic: CH2PR12MB4889:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4889195642E5828508E97BDC98D80@CH2PR12MB4889.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7S+deSiA511YRqzTSByZlGoxIeWuCnGctk+63Y3vPH+ZM2jRvZ+9MW5kn147X75jbHqyy4Vz+08sLA/vtQSQmDawemYvS3SyAdXzOEkiudJSMmqExvXohCFbLxhqaRhcTVPGIrcLTfmX5VGWYG4VtKWQa35GNPsC/T7wQRoVpOcabkrgzZ8CBot704WNG1KNVa9Lyyi9YIEew/hhPIUTkavcmux92YNiaQRDrT/kOWu18RfSMX/wT81+pmNrHcvCoVD8/x3IaYhJLzDtPwpv7m2I7EdeUOrXGDySMue90Dj3ENz80TOUcvQKCPXE26Y7O3G72XkOs865DQn2If7Dycg/uQ0gsBE949kGXANLR29FxUzWL+zcBIZkSxkGvueKp0zKjw8/5rkAaKMm/uVO9tLeJcy8v3bloYHjOVuUcCof1vkRjNcaUYpE88RKyM5S+5IP9bqEPnvrrwdZNPLmdl1S8oSo4dfotYejyOJAi7nCyKRTR2Y6QWgwxrKsbHP09HO17sBt+FQ4Of7KUkj4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3781.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(9686003)(16526019)(6506007)(4326008)(45080400002)(966005)(33964004)(86362001)(186003)(44144004)(53546011)(2906002)(83380400001)(5660300002)(1076003)(6636002)(54906003)(110136005)(7696005)(52116002)(66946007)(66556008)(8936002)(66476007)(8676002)(21480400003)(478600001)(55016002)(316002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWNxY1RHWWZaOFdnSng0Y2NuYW1BQ3JuU0ovM0lScWdxbnJZS3l0QmYzQjFD?=
 =?utf-8?B?c1YvU1R3ZlJnY0o2OEhscGlYQTlwNEdBVDJDdldqeG51eWxOMGVTZC85MnRY?=
 =?utf-8?B?c05xSzk5SEJxKzF4N3QxdDVDc2VDc0ZJaGNUUDB6M0t4YW5KMkMyUFZVVnd3?=
 =?utf-8?B?cUt6ejh5bXhteHV6Q3JPdGN2SWUzaS95SFlqMWhraWJoN3pTcE45M1dWU1hh?=
 =?utf-8?B?S2kzekdmOW5ZSEswNGUxZFlTSnE2a3B0QXVWMC80eDJmZzBmZGhQeVBVWHBr?=
 =?utf-8?B?QS9ZeGhUSUVjNVVqb2VwYklWcDkrejRLQTZFL0Rkd2lmd3dTa1JCNm5lN1dy?=
 =?utf-8?B?T1NTdndHRHR1NW5JWU96YWNqVGk2UTFtZ2oxK0hzSkhzWWo1d0xMN2hGQ0o0?=
 =?utf-8?B?TWhXTlc3MjE5Q0IrR1F3OUNhbzhSNDJqK2N2bFNWVzFpeWRaK292SmJoaUtX?=
 =?utf-8?B?SVZhR3lpQTd4Y0ZYc09nenF5M1ZUSEJTRjVKaEFseEg1aHRiOWpHbml1SFlT?=
 =?utf-8?B?Y1RqNC82RzVncDBZdXM3bXc4YytJdjFGWWE5YVFPNFlzVTZMcWJCTTZnbGpB?=
 =?utf-8?B?MEc5blNycVhSbXZ3M3hBb0t1ZHN3eTBjeXRvRnZieVRxYitSUVhPZTY2bGt3?=
 =?utf-8?B?eDZVL0d3d1VJR0tDVytLMmV4MTF0WTQrZEwxNVdsaVZnenpHa21IMktnM3lK?=
 =?utf-8?B?NUpjcDAwWStpYm1zVXdCWittTCtYWjhzSlYwTnJCN2w4QVA0eFA4ZHdtMm5Q?=
 =?utf-8?B?U1UvMldkZlAvSU4vS0tFN21jZ2tOY2t6MU42RktQdk1qUW15RFFLSXNJNGc2?=
 =?utf-8?B?MUh3WlpzaFh4VGhVTzZZTVRESG5rZUdhcFFjV1AyNWVHclI2VHZ2RlpHNzB6?=
 =?utf-8?B?dmF3UHJnZzREQ1ZBY3cycEhsc0d1NjRhRS9rcGJpNmFubVNBUXpCcXhKL0Y5?=
 =?utf-8?B?UEVYTTdlazBrVEtVYmlEdGJ1QVRIUTlldXhYcE1aOTFnYmhROFc0R3laZXBZ?=
 =?utf-8?B?R2VJKzUxTFZaWWVWcHNpcVd1WGVuQktCS2M0UkFaQlUra0huR2xIc04yRkw0?=
 =?utf-8?B?TXpZRjFOZGdxaGVMV1F2LzNNOEFnbDRmbEc4SHBFS2pzOGIyZkFTU1owSkJN?=
 =?utf-8?B?N2ExRTVsaXJFTTNzcjgycXB5bExnWktMOU9PQi90V2FWZW1LZElLN2hqWjA1?=
 =?utf-8?B?aWFiZ2h5TytEeW1aVkM2dk1odHFFajhQNllSZU5NNXlKdUNFeklyK2h2WEts?=
 =?utf-8?B?bHB0N3RrU2dmcjk5NFowRUJPWC94MWJOWkE2RnQ4Nlg0ZXFXajUreDhoa0Y0?=
 =?utf-8?B?ODhQTlBDMWdpNXFmaFhOSlRKQ3ZIZU9ldncxK25oYStsNVh3LzhZbkJ0bTBh?=
 =?utf-8?B?L2w1Um9wa3FMeXp6SFRvTzBHZmxGc3VvUHhrbVJGVFpzY2FyeVQySnhlczFP?=
 =?utf-8?Q?vJaVCPBd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3781.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 17:01:22.1706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e22631-ec8d-42e2-affb-08d8ac1b5e91
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fj1b6aq1ly1uWUNBWPrVp/onTIOQsn5g06wR1j/Af2+qgQkpRlFAG33bkXyCFNT5t7j2vcYTbXJL39RKQSl9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889
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
Cc: "Pavic, Josip" <Josip.Pavic@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "R, Bindu" <Bindu.R@amd.com>
Content-Type: multipart/mixed; boundary="===============0633903076=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0633903076==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcj2nfj6iw5b2a66"
Content-Disposition: inline

--lcj2nfj6iw5b2a66
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This patch should fix the issue:

 https://patchwork.freedesktop.org/patch/410754/?series=3D85303&rev=3D1

Thanks

On 12/29, R, Bindu wrote:
>    [AMD Official Use Only - Internal Distribution Only]
>=20
>    ++Siqueira.
>    Regards,
>    Bindu
>=20
>    =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
>=20
>    From: Alex Deucher <alexdeucher@gmail.com>
>    Sent: Tuesday, December 29, 2020 10:07 AM
>    To: Linus Torvalds <torvalds@linux-foundation.org>; Wentland, Harry
>    <Harry.Wentland@amd.com>; Kazlauskas, Nicholas
>    <Nicholas.Kazlauskas@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>
>    Cc: Dave Airlie <airlied@gmail.com>; Pavic, Josip <Josip.Pavic@amd.com=
>;
>    R, Bindu <Bindu.R@amd.com>; Deucher, Alexander
>    <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>; L=
KML
>    <linux-kernel@vger.kernel.org>; dri-devel
>    <dri-devel@lists.freedesktop.org>
>    Subject: Re: [git pull] drm fixes for 5.11-rc1
>    =C2=A0
>    On Thu, Dec 24, 2020 at 5:28 PM Linus Torvalds
>    <torvalds@linux-foundation.org> wrote:
>    >
>    > On Wed, Dec 23, 2020 at 6:29 PM Dave Airlie <airlied@gmail.com> wrot=
e:
>    > >
>    > > Xmas eve pull request present. Just some fixes that trickled in th=
is
>    > > past week. Mostly amdgpu fixes, with a dma-buf/mips build fix and =
some
>    > > misc komeda fixes.
>    >
>    > Well, I already pulled and pushed out my merge, but only noticed
>    > afterwards that clang complains about this, and I think it's a real
>    > bug:
>    >
>    >=C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc=
=2Ec:475:6:
>    warning:
>    >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variable 'val' is used uninitialized w=
henever 'if' condition is
>    > false [-Wsometimes-uninitialized]
>    >
>    > and it sure is true: the code literally does
>    >
>    >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t val;
>    >
>    >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (opp_id < MAX_OPP=
 && REG(MUX[opp_id]))
>    >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_GET(MUX[opp_id], MPC_OUT_MUX, &val);
>    >
>    >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return val;
>    >
>    > so clearly 'val' isn't initialized if that if-statement isn't true.
>    >
>    > I assume 'opp_id' is always presumed to be valid, but that code real=
ly
>    > is disgusting.
>    >
>    > Just make it return 0 (or whatever) for invalid, possibly together
>    > with a WARN_ON_ONCE(). Ok?
>=20
>    Harry, Nick, Hersen,
>=20
>    Can you take a look?
>=20
>    Thanks,
>=20
>    Alex
>=20
>    >
>    >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Linus
>    > _______________________________________________
>    > dri-devel mailing list
>    > dri-devel@lists.freedesktop.org
>    >
>    [1]https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%=
7Cbindu.r%40amd.com%7Cae8f547c9287426b9b9408d8ac0b7b73%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637448512618562550%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3D4gcQRS3HI4u1UEWu35Ze1w5CLWmAof5nouCFQoKEQD0%3D&amp;reserved=3D0
>=20
> References
>=20
>    Visible links
>    1. https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%=
7Cbindu.r%40amd.com%7Cae8f547c9287426b9b9408d8ac0b7b73%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637448512618562550%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3D4gcQRS3HI4u1UEWu35Ze1w5CLWmAof5nouCFQoKEQD0%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--lcj2nfj6iw5b2a66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl/rYNoACgkQWJzP/com
vP9PfxAAkSaOQSg4PllovnPTHF3OfbjYTj5Q23PTHOu/Mic2aITkarn4Ia4Gn4+G
uOPIFMPJTvQEU7ljkb9BBmauIDC18muzvw/Of7V3ZpG/EyO2XKTHHAAb5Di2dEFk
sxQy9s3oiCiTIyIbDEKGkDIsKaQ3nO0UQwFOosU7zvDIx1FRve9V6Oeyi5F9D5Gs
esOr7wVLdbtHtFfgWmcpqJO/e2kz+zrHRF+Z3KkUoYp9I8LqHSzTlvZiqUgiaaul
LmNn1TvqtYUlleB62lRhrSN6OsJ8XOnkTkDvsc7K3ObSl1zmEq7/j8H2ef/N/zYS
uv/MK3apu7phCC9td8t3SrUUsvAipL5G+OMbsFs3pTF4sPxbJ/5mEUmXKyEIKmLN
l+M0BepXgu980kmomBPZxHUQExeFvGNgzjINmdHvxEbRERMpRdL6Vqe5hmDX91zr
GXoWurYW8TItfnMdDuhf0Etngft7fXMxXBrOZ4Vr1QoVBk3bgxGixMmGzx70xPif
0fXa1ZnAL/Am5ASYU1trg49SbbVxMIYN4ELHe2+6YMjvSuc1Xk7izLvtsQCd+3Wf
t5HUhHykv0A8R49ow0Pgg5FmCSbIgGhFoj1llgt93ZA8OeOuhY9gkHHOe3ISDUXE
VbZhsia28EKHF7JgYaMuhe+BxwkF3JWvbAoxAtuFcf1O0Wm2KK4=
=3vms
-----END PGP SIGNATURE-----

--lcj2nfj6iw5b2a66--

--===============0633903076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0633903076==--
