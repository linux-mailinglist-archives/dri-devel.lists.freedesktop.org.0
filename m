Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49718856C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 14:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34236E120;
	Tue, 17 Mar 2020 13:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0F56E120
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 13:25:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffoimAhoQexCDvqUOUY2AUCyPEfMTl5xziVLXB9BFfHXyHrnuY5/RRS2X6gU+NCmzKgHSTuKdgZB+12CJqWJFrNHwPswTfGR8M3YgpHIjoILBvtxxIe7cj/IxgUgC/OZP7f2aqPs2iCTkDZwKm0ge44mZLv7vAnC7o/Y/W0zjVi9DI3iySqB+jacmHnj94aApT6WEJBDBFFW/7WZm6r7+I097it7yAgdDB/vtcRRchE46UIbH3nXFWEUSVts+4werB5j0bwxCDPQmK+mxOUrj+5kpPOVSAGe3D2Fd8O2Q7572NSWzBqLewARLi20Jg9yoSiO6/Dp0FelRV44At9/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZFAUYMtGJwp3nxdAtcAm6UtvP54QhvP2+EiWcIZxPI=;
 b=KzkfcNLi2b/86qU37o0oKJ49SCOSdWtMvmuK1YXQ1WiwA/nqHzeAM42zvmzMqiPK7Zkm6s5NeOJrhxTZKfZkEP2MGXMywFvCCrvVl4JAqVLhucNEehRI16Sv/Eql3p6kKrXwg98F3ZKmhl+0CBnko6FpxXYl4Jph+X9b3x6CqM+P1keG5e/BvsAfmptvtGapfItfEU35Rf3FDQ1Cjv4AeEp7ynma3WZXBrVpHk+8fMaTDhMHtPclzXPtrzSWX7bvSFRlX2ro8YKP6Su6p32sg3Ak8haiiAxMiHGSEQ06vr7z2Ezw9gVMxqCfEW13KHfxwKHSk1lN6ogTDntNylAUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZFAUYMtGJwp3nxdAtcAm6UtvP54QhvP2+EiWcIZxPI=;
 b=VOJeFdNIeiJHoHCqQcJoEqL7SGq3WMVNOk1mVXDRf3HcKQEERXvQdBA2Z1s3czrpk5ybFwJNaA7e7ghcXLNjau4X8lAdq7AqA6HJnc0WpEWh9fzLCMOGEQsYZ4gaxaF80SoYE6XOrnwEVC/ucsTY2+hfxXwrh5zCQDQgsZlv9+o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18; Tue, 17 Mar
 2020 13:25:37 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 13:25:37 +0000
Subject: Re: Variable Refresh Rate & flickering screens
To: Simon Ser <contact@emersion.fr>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
 <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
 <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
 <db6547cf-77d7-5163-8926-e1bb5ddb6d57@amd.com>
 <vjPM-1gAz4OKHfOHPPwHH_InBbZpD9EsrXKujfN7QKEEME_LmCEsZ-tXJiAAOhyG2mkN8GcNZmpEgGwRgqPlOYumKiLXk2jBGZuWavGYVMM=@emersion.fr>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <d921efb1-1074-1ac2-6eda-8ebb39a262d8@amd.com>
Date: Tue, 17 Mar 2020 09:25:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <vjPM-1gAz4OKHfOHPPwHH_InBbZpD9EsrXKujfN7QKEEME_LmCEsZ-tXJiAAOhyG2mkN8GcNZmpEgGwRgqPlOYumKiLXk2jBGZuWavGYVMM=@emersion.fr>
Content-Language: en-US
X-ClientProxiedBy: SN4PR0701CA0010.namprd07.prod.outlook.com
 (2603:10b6:803:28::20) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::3] (2607:fea8:9240:c66::3) by
 SN4PR0701CA0010.namprd07.prod.outlook.com (2603:10b6:803:28::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22 via Frontend
 Transport; Tue, 17 Mar 2020 13:25:35 +0000
X-Originating-IP: [2607:fea8:9240:c66::3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c8b23f4-06fc-419d-8b3f-08d7ca76ae0a
X-MS-TrafficTypeDiagnostic: MW3PR12MB4508:|MW3PR12MB4508:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4508F385CA82D2844F7154B38CF60@MW3PR12MB4508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(316002)(66946007)(2906002)(66556008)(66476007)(6486002)(53546011)(2616005)(54906003)(52116002)(8936002)(6916009)(478600001)(31686004)(186003)(16526019)(5660300002)(36756003)(81156014)(31696002)(8676002)(4326008)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW3PR12MB4508;
 H:MW3PR12MB4379.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuEz1xhQGidB0IpVN/NZBXFalxIXWYbPHJzoZ9b+FCkGJ9jMrvfjrox5GB6Y3zTs/vBBD/n46sKzrez0JqB8YTUvNsqrNcoO14SUmBxf0xCY/71M0QRttXeeVdnXKE6OpgFGh5jXcbLt+tuuScxyGKSrYvpIM3N9P3tjsFNrt38WL0Z/Z2BPeRInM+C3p+LV3HoT4ZhJB4W5iLNHOLetxjy+mOpNEzixDhtzz4GxugRi9gVTmAfb+cMicadU/oj2c5kRm1v3LWmeigL2EYJq2D/egRderYeR65gYneW4Bv/agv4RJ5PVWimNowASZtUU5okwgFeCs770f+53CUKHkapgYLecVG2i11KQJ6vpiW86yON+gyFklKs0PnLqFCMSK5ZAn791tV/e7XH3Ic2v6/UR5HNQDBxum3l54XC33hKXwau+Gb0ikcCk6vHCx17/
X-MS-Exchange-AntiSpam-MessageData: R8dOZn5Hf/one/GkmuQ1AhgfGknkFe+GdhaFvwAxEGpPT3d8pReBH3a484drrSfJrli2F5VXLZ5ilMbWHrttgpqA5aJjkRmgD72RiTLfEsFqajOJV8HKIBmDVy82jQSdV3kDtF2dli3+XWPxpEbLtRcTSBEUCSTElwSscpZJYjc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8b23f4-06fc-419d-8b3f-08d7ca76ae0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 13:25:37.3532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8U5ep0BFxuTeZ3i4cgRDpC5+s7b3YepFAi99yiBuLM4BFvKtxrFnB5v6S2LV36zptn1cH+TV+bXacSLt01LNxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
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
Cc: Scott Anderson <scott@anderso.nz>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020-03-17 5:08 a.m., Simon Ser wrote:
> On Thursday, March 12, 2020 3:43 PM, Harry Wentland <hwentlan@amd.com> wrote:
> 
>> Not the main VRR expert and we're still discussing this internally but I
>> think it'll very much depend on the display whether you'll see flicker
>> in this case.
>>
>> The other complication is that for gaming we don't want to use the
>> cursor as a VRR trigger and only look at page flips in order to allow
>> for smooth gameplay. For a desktop use-case that's probably not the
>> right policy.
> 
> I think user-space can handle this and correctly synchronize cursor
> updates with game updates via the KMS atomic API.
> 
> However I still think flickering should be avoided by the hardware.
> Flickering is a completely separate issue and user-space shouldn't add
> workarounds for screen issues like this.
> 
> Do you think that would be acceptable? Do you have any "slew rate
> register" in AMD hardware?
> 

There are no slew rate registers in current AMD HW but I also think
slewing would best be done in kernel space, either directly in HW by HW
that supports it or in SW for HW that doesn't support it.

Harry

> Thanks,
> 
> Simon
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
