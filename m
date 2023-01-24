Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28424679D04
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C1710E6A0;
	Tue, 24 Jan 2023 15:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F211B10E6A0;
 Tue, 24 Jan 2023 15:10:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30ODesE4006507; Tue, 24 Jan 2023 15:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=DOO4MJl+UgJlVN8a5vyuUEspYQsJd5rRJZ74mJGvtY8=;
 b=gnQLOXOvH5GGsDb/3ZFlKpXoETirPZc3YyfWHqvu5fepwTOjbl+brEjaYisw+a5i+aUz
 7m7ntlBe9CFm4PIm7NpIFvIiEDEL+jzIAHBjvhHCNMsf1RgrQ6rBrJAgApDJzAiS2yvw
 6TN8ZmU8f9mdm3ghuuCzt1GOgsYQog28G8pvSyAV+bDtF8LXHd8MEXxyxISsjhWRtUKK
 yjBGR0jYHZSuKi9Pa+QYJ5QqYLg/pEUzHTf0dfjkPtz4F/wdkT14AwPwAuT1A8P9hlDn
 uY6TZ87PkzijmY6FmDBF/v5ydx3y8V4XmsUJ92sGoQ0i/RlqfC9bH6hQ4Xny5y+zCLXJ Xg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dnd3qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 15:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovw+AsMBtR3Lv1jnUt4Qv2VPoMSxXXT4F1q+Y4SnU+11ru4mRLaXkwMbJ5eR1mVijoDshsIPHkI8yd7Ob2yTF1OpL7ejzkaskucdcgXmiLduFLqnzs0+qTh6mTUm5B09ddOTKYsOD7z7L+4SJ21BZrVf3muDSjv8WDjq84YBBNtjICF8ky9ShnLQwd7dEQ64KrNkH3sXE6fqx4pw/FcBVbT92IUiXG25STmzZ77xDs7GJm1o/EHONzLIyPXRiZYfEZsSvPFwpfkmag8cmmiExbMxOZfEcixLLUbHvzcTAlzPvRN5fd2a0AVFKrbD+VZaUrKRY9OQZLAeJvBB5smYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOO4MJl+UgJlVN8a5vyuUEspYQsJd5rRJZ74mJGvtY8=;
 b=S/5j3rM5uoCZH7H0XeERGuaW1SfTWx6dWY4wAeD/AjBDxW3rmokoDN8jp+aUvwklXxsDTz1YkfW/O+rq9Y3UhFXVHA6EfV0c7+dc1ZBib4B6Pk7PWCbpncWoSB9FJ3qinmUzcNNlpjer74CWOryMipOQnY+azv9r0zwnFn72czOQMTMHq3hGPJh60jiGlvU3t76+T4DXesUMKEAb+e7V+sYQc3dpqBaJiVBj+2VnlseHefWY2amto8GfTS19LzNRKNeoW755QHuiVvnkQ6Qv/CjTSQ2BmfTzfkACmSXbxk3MYU9yAeT8sHROTH6DvgbByHdVoT0dwM/ru0fOak/f1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by PH0PR02MB9384.namprd02.prod.outlook.com (2603:10b6:510:280::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Tue, 24 Jan
 2023 15:09:57 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::d5de:8903:d3c3:8436%8]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:09:57 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH Resend v11 05/15] drm/msm/dp: disable self_refresh_aware
 after entering psr
Thread-Topic: [PATCH Resend v11 05/15] drm/msm/dp: disable self_refresh_aware
 after entering psr
Thread-Index: AQHZLBIiTJRhrb4tt0C2m/SoeuKp966su3mAgADwbBA=
Date: Tue, 24 Jan 2023 15:09:56 +0000
Message-ID: <BN0PR02MB8173B73AC4E3DB9A7D0509DCE4C99@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-6-git-send-email-quic_vpolimer@quicinc.com>
 <4a359748-e53c-a178-de09-2c999eb69013@linaro.org>
In-Reply-To: <4a359748-e53c-a178-de09-2c999eb69013@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|PH0PR02MB9384:EE_
x-ms-office365-filtering-correlation-id: 3e73c149-c19b-4310-4ec2-08dafe1d0e00
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CCA75QPMlqNfrYrJmHkTW/ewC7Ldh5vyOFExL/9+LOf4sLjZowNvupteA6TS/UofuxLPOHzGw1HJ+izT5hYzB8b7B8mavRrYqGAIhE9dHdopDYZ6Ty06DKU2y5fcBH2yyNShGYPqBXLk/G0FEDg+JJ0Hc1UCUHUGuA1CMgTBbOgw/S+mtFA83+ketm+/YCeny62Fzgetv7XNgdfKz49umEm1Pah3Q83bD5p4FjpEn6mHZgHCJodvgc5W+aitmH96eWtfngptBTRvyF0hsD+USBKQDZTLnnwgCoCIRVolHfhn7Qj1kaAqFVQ1XgciR8vmCf3sqI3vAcfxmbZrnhvrizGfQ0EUTxnWcqNUQiaGXtbHiuTy8zJaZsqXCip+vjOlDAjTcullxr99MOrSGeCGuOifQbUS189KOdEUQU4RsYFlCzgge6fDU0Qvb/YbZNkTUB8LZn/5O2t+e6XBjZo2c0gFsDPgEFrM7ccODDIkp/9lr8MNDAv6vexzXSkmiAOY4RdQann8sfSa/0gYG34V0kkE0XMlpnlUtxGPgLsqYXPTP+09wpxabG1x5m2KyGkPikBAHwpfDSNGqAUfPUgeSpV79zI5B9y8LZoPNcxi37xMz5G6Tg4jZzhN1q8thXuB5cqZJVQtmqWrSBQvP1W/9HXScuXUeio6sVeQ+0IuZ2hkc5kZvy75Zp2vyuBlmCXdhuRGiUIHWmwL5aDpbuyngQNA9hz4Exm4loTPX8fuVgg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(186003)(9686003)(26005)(86362001)(478600001)(83380400001)(66946007)(76116006)(55016003)(2906002)(966005)(64756008)(53546011)(316002)(66556008)(66446008)(4326008)(66476007)(5660300002)(8676002)(71200400001)(8936002)(122000001)(41300700001)(52536014)(38100700002)(110136005)(33656002)(7696005)(6506007)(54906003)(107886003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDJzQ1dNM1NhY0txTEVzb1h3dkwrQkxKRUZvUFNaK1V6U2hSRnRoUVFTYTZ1?=
 =?utf-8?B?MmtXSFVCUmdKd0JpUTh6RUNJdjFxQWtkMWtEZXllaVJwSXlGZG9aMlJCNVJZ?=
 =?utf-8?B?SkhDT3QzQ2U3WTlLZUs4MGQ5bjFSSkFTSGNTcXk0R3VHNjJJcE82UUZKUzI1?=
 =?utf-8?B?bTY3UG1xeDJlelZOOFE5bTltL0Z4NTczeHhSMENMcWFUZlUzN08yWHhseUJI?=
 =?utf-8?B?RlJHVWpFZFF2S0s4R0laamlQYTlNWEgwcXlwK1ZPM3k0eER1M3hQN3lVZnhD?=
 =?utf-8?B?Szg2djRJRWRxTlI2OWE1RGpWYmI1TzNXRWI5TnlNZS9hc0FPV2phNlRoS3hD?=
 =?utf-8?B?WkQxS3RPZURaQ2FuaGpmNERZZG1tNjByZFVmdVhubzAxZnlROEFQYmp3Yksx?=
 =?utf-8?B?RUhrMFdyNGV3dFhnb05IN0VLYjUra2VRUS9QOWY5OU82NTI1TU1USjVsNEk4?=
 =?utf-8?B?VFRrSU83YW5ONFlRclR3UkZnQmNTRkkrUmZOcjNlVVROSjZHRldqTVZESEM2?=
 =?utf-8?B?Sm8wemNNbDh1aXEvZm9nTjMrVVlNRXk0RXZTV2tWQkoyaXZydVJxQjFrSnY5?=
 =?utf-8?B?bGswTnRQM3J4bTN0M2h3UU0vdWVoWUY4azBvanljSWRzd1FGTXNIY2hLbXk1?=
 =?utf-8?B?WHd0Lzd5dC9LeHZNaGE0Y0xrb0VmYjc5eEpVeXVGbno5S3FqM3VITU5MSXlF?=
 =?utf-8?B?bktJYWRvUk9NblVJQm14QWZ1U1ZNNDF1V3Bva0ZXTGZHdE9MdHZnWitlUHgv?=
 =?utf-8?B?ZSt0Rm5BYzZwUXZkdm5ld0ZXb1FNNjZtQUhFRE5PZVlsclFJelFNd3N2aWty?=
 =?utf-8?B?Yi9MM255QXdUMEFPMGI3L3haYVdmajliMUZtTjJDS3F2dU00VWJpZDFXak1z?=
 =?utf-8?B?TlUrYlpWMno1N0ptOGhaM3V4bnJsTWNMODc1NVZvMllUUW1uaWdVQ3ZPTkdw?=
 =?utf-8?B?aWdLanRLWjA4aDcyakpIeTdRWTlNcXFzdEJENmRPdWFFVzNNZFdYZHdINC94?=
 =?utf-8?B?SUpkaGRxdHBNSnpydGUzdUJqM3BKLyt2bitkSDRkSlNQQjFLbUFtdkV3RVdC?=
 =?utf-8?B?dk1ZQU5JMDBXL1I4UVpWK25acWd4ZjRoN3JPVW1XaXVuc3dJT3dLUWUwdEpu?=
 =?utf-8?B?Sy9QVFk2YlRIaW1vbHlGL2xWamswOVY1cTFoZHpqeTl4U3d4N2orcGY0TXhj?=
 =?utf-8?B?STVvNUV4TDNBZFJDbmNBd2Q1azVGTExLV1paVHNFelRhb3k2ZFhGakw4azhB?=
 =?utf-8?B?a0tLYmRWbDhLd215UW1qcTdrc08vM1ltRW5aZko3VWpkYUhTRVZ5RVlNNk04?=
 =?utf-8?B?cklRTVQ2Tkh0RGcvd2oyVm1IOVJRQWRPM2VGb0hEbTk1WWZ5LzhHaXkya0Zv?=
 =?utf-8?B?OXdJcmUxdjI4NGpObFAzeGFkWUN3aVozZno3TXgvSENWSEZwdFo1R0YxZ3RI?=
 =?utf-8?B?bTVPdUREQUZidWxLVWwzbmUyYWRtc1kxclkxV0xWZGdDU2d2R3pZd0xlbzhG?=
 =?utf-8?B?ZnlSa2V3VUUxTEpBKzRyQ3NvMVVld2pUanVQQ1VPN05ySDNKNTk4OHFvenhm?=
 =?utf-8?B?ZHdORkw1Sjg1bHZQRnF3MDM1WkpQZlZ3QnZ3SlpZWlZuLytsZytnb3NMMUJG?=
 =?utf-8?B?UUV5THhtcE5iTmRyMTZWeXpXZ0xVVnFSNnlRWEQ4ejFtSXhWRE9IT1ZES29V?=
 =?utf-8?B?U2hoZThkb09UaE1GMWhZVnIxdjBPdTNqdEM4ZCtTbXdtakhpeHRYU0J5ZUcx?=
 =?utf-8?B?eVZDanR3SUhob1BpRE1tMXROaG1vZHJuNTAyOGkva1I4bjFRTnNYT2N5QXg3?=
 =?utf-8?B?T2kyK3ZrOVlKdHFQb0Z3OXByWGR4ZTAxMUNUcTFkUW81VHV3azBaRUM4TUJT?=
 =?utf-8?B?WHpabFBsbTRWb205eHF3REJUV050b2tvc0IySVF4UStUTFpRVlhHZzdRUnlr?=
 =?utf-8?B?eCtLVm5UNVRmdlJmb2xsWFRmeURyTzI2d2hSVUpnNWtjS0xuNHNHTlEyMll0?=
 =?utf-8?B?QWFDclE5R3VNQjNkck9FZktYMml2dnJXMDdEWXUxTXhFZFJ4YnE3cTg5aytE?=
 =?utf-8?B?aFc0WllIVVVIMEoyQnBNRWJTZHErSDJhalNMdDhydkk1ZXcxeWMySTI1Z1I3?=
 =?utf-8?B?SFdlWmNUeG9icHFVNDlUNW5mS0VhSU13Qm8wdGd1UzVtTWJZT0V2dHRXR3BT?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lCOseGxjlOBltGvk5rNzvf+8hYKfb7eY/tVV0hn09wdLAwwquFVcmXf7Z5HjQBYLkPDcLFUoYM/61SyJ0nwHI/N1DE5PATIYeyDu2RgB4/Oiw2Zff5YE5VOUXgRSRUNL0mUuHXDjTDcKZ/Hi/F3yGAeXi52qv+1xoDezguoeG4vJ0ceqDtk2gz5WnnzMh5dfndyO6C4kmU260yrOXWFlJv2LsA1wh15klZqlfdLttQP1/+Jpi3BnuL8WcpXk/DEXhGoLxeQNLW1v8OI1zidIt3MPDO4oKnsH1u8UBkvP9hPFjsJuPdtgBTbmdwLXea7hZE1ilk93AgVKLklkdMIGCi5hMU/AiD0Z4PSLY2YfqC5yY9lfIerox37qJwHQ7b0FIkefsjYMBpGM5SlbFBTtwSa5g41/2rRBdtALN1oc5+Q9+I6ffU/F4kw+hOqOeNgGo4dxyF5RpYUgz9GZk3En66reKml3BHsDz7rt1ifcSJdoSPM8ZGoMCUb11JIhq7hN/jNUH3mEmUNJGWmaoWXevRc8vSVNEMY++QP6G4Eh+fs0hkTZYeyfaKgzfxi1VmhbNcD4xyPAhlsU1ghsdgFoG7IJOZLtzAkOOeXV34mA0w2qkmpPqRFoz0saoPbFaZfkISTZLoQC+nRcM8cfp6jZ2z2O7sQvp1L3rPKDKsLlaO1pLas6xW2gGA4wTvZllqhD80BmgMfnewyksAoHpn6HunFXDHFNKOJY9wF3C7UVHWyBmKhBUo0dPdabs1pOZf0zHcjRHiWi9uAuZzTdqyzy78AcGXCsU/NQ3wXq2xmy+6q7+4J4uIbi0sL+gs4H6PHXJPoE/SxVwfeQ2OAeL6gpn7jSBDwp0WW/+afzUH5pv5vXw9n4KXUGeIJyuPUpTBaEPnVB4qIwaKfzJaoVzQ9tSWUy1qlwj5sbqOLP9d6heZA=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e73c149-c19b-4310-4ec2-08dafe1d0e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 15:09:56.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQlOfywj0WTaFNltPBUbhka511oRXi36s06W8OjTJ+gwmp1km/sSA8KkX4tcQOJgYyW973WwyF6W7CliF72727RK1a1B4U2fUsPrGBhrqHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB9384
X-Proofpoint-GUID: wBWhqHTdxPgKSU-a7amiahl1vIJCz6Be
X-Proofpoint-ORIG-GUID: wBWhqHTdxPgKSU-a7amiahl1vIJCz6Be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240137
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5
IDI0LCAyMDIzIDU6NTIgQU0NCj4gVG86IFZpbm9kIFBvbGltZXJhIChRVUlDKSA8cXVpY192cG9s
aW1lckBxdWljaW5jLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBs
aW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFNhbmtlZXJ0aCBCaWxs
YWthbnRpIChRVUlDKSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT47IGxpbnV4LQ0KPiBrZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOyBkaWFuZGVyc0BjaHJvbWl1
bS5vcmc7DQo+IHN3Ym95ZEBjaHJvbWl1bS5vcmc7IEthbHlhbiBUaG90YSAoUVVJQykgPHF1aWNf
a2FseWFudEBxdWljaW5jLmNvbT47DQo+IEt1b2dlZSBIc2llaCAoUVVJQykgPHF1aWNfa2hzaWVo
QHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbg0KPiBQcm9kZHV0dXJpIChRVUlDKSA8cXVpY192
cHJvZGR1dEBxdWljaW5jLmNvbT47IEJqb3JuIEFuZGVyc3NvbiAoUVVJQykNCj4gPHF1aWNfYmpv
cmFuZGVAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPiA8cXVpY19hYmhpbmF2
a0BxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBSZXNlbmQgdjExIDA1LzE1XSBk
cm0vbXNtL2RwOiBkaXNhYmxlDQo+IHNlbGZfcmVmcmVzaF9hd2FyZSBhZnRlciBlbnRlcmluZyBw
c3INCj4gDQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2Yg
UXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywg
YW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24gMTkvMDEvMjAyMyAxNjoyNiwgVmlu
b2QgUG9saW1lcmEgd3JvdGU6DQo+ID4gRnJvbTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1aWNf
c2JpbGxha2FAcXVpY2luYy5jb20+DQo+ID4NCj4gPiBVcGRhdGVkIGZyYW1lcyBnZXQgcXVldWVk
IGlmIHNlbGZfcmVmcmVzaF9hd2FyZSBpcyBzZXQgd2hlbiB0aGUNCj4gPiBzaW5rIGlzIGluIHBz
ci4gVG8gc3VwcG9ydCBicmlkZ2UgZW5hYmxlIGFuZCBhdm9pZCBxdWV1aW5nIG9mIHVwZGF0ZQ0K
PiA+IGZyYW1lcywgcmVzZXQgdGhlIHNlbGZfcmVmcmVzaF9hd2FyZSBzdGF0ZSBhZnRlciBlbnRl
cmluZyBwc3IuDQo+IA0KPiBJJ20gbm90IGNvbnZpbmNlZCBieSB0aGlzIGNoYW5nZS4gRS5nLiBh
bmFsb2dpeCBjb2RlIGRvZXNuJ3QgZG8gdGhpcy4NCj4gQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5
LCB3aHkgZG8geW91IG5lZWQgdG8gdG9nZ2xlIHRoZQ0KPiBzZWxmX3JlZnJlc2hfYXdhcmUgZmxh
Zz8NCj4gDQpUaGlzIHdhcyBkb25lIHRvIGZpeCBhIGJ1ZyByZXBvcnRlZCBieSBnb29nbGUuIFRo
ZSB1c2UgY2FzZSBpcyBhcyBmb2xsb3dzOg0KCUNQVSB3YXMgcnVubmluZyBpbiBhIGxvdyBmcmVx
dWVuY3kgd2l0aCBkZWJ1ZyBidWlsZC4NCglXaGVuIHNlbGYgcmVmcmVzaCB3YXMgdHJpZ2dlcmVk
IGJ5IHRoZSBsaWJyYXJ5LCBkdWUgdG8gc3lzdGVtIGxhdGVuY3ksIHRoZSBxdWV1ZWQgd29yayB3
YXMgbm90IHNjaGVkdWxlZC4NCglUaGVyZSBpbiBhbm90aGVyIGNvbW1pdCBjYW1lIGFuZCByZWlu
aXRpYWxpemVkIHRoZSB0aW1lciBmb3IgdGhlIG5leHQgUFNSIHRyaWdnZXIuDQoJVGhpcyBzZXF1
ZW5jZSBoYXBwZW5lZCBtdWx0aXBsZSB0aW1lc8KgwqBhbmQgd2UgZm91bmQgdGhlcmUgd2VyZSBt
dWx0aXBsZSB3b3JrcyB3aGljaCBhcmUgc3R1Y2sgYW5kIHlldCB0byBiZSBydW4uDQoJQXMgUFNS
IHRyaWdnZXIgaXMgZ3VhcmRlZCBieSBzZWxmX3JlZnJlc2hfYXdhcmUsIHdlIGluaXRpYWxpemVk
IHRoZSB2YXJpYWJsZSBzdWNoIHRoYXQsIGlmIHdlIGFyZSBpbiBQU1IgdGhlbiB1bnRpbCBQU1Ig
ZXhpdCwgdGhlcmUgY2Fubm90IGJlIGFueSBmdXJ0aGVyIFBTUiBlbnRyeSBhZ2Fpbi4NCgkJaHR0
cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2Vy
bmVsLysvcmVmcy90YWdzL3Y1LjE1LjkwL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNo
X2hlbHBlci5jIzEwNQ0KCVRoaXMgaGFzIHNvbHZlZCBmZXcgZmxpY2tlciBpc3N1ZXMgZHVyaW5n
IHRoZSBzdHJlc3MgdGVzdGluZy4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVydGgg
QmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZHJtLmMgfCAyNw0KPiArKysrKysrKysrKysr
KysrKysrKysrKysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
cC9kcF9kcm0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZHJtLmMNCj4gPiBpbmRl
eCAwMjllMDhjLi45MmQxYTFiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHAvZHBfZHJtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2RybS5jDQo+
ID4gQEAgLTEzNCw2ICsxMzQsOCBAQCBzdGF0aWMgdm9pZCBlZHBfYnJpZGdlX2F0b21pY19lbmFi
bGUoc3RydWN0DQo+IGRybV9icmlkZ2UgKmRybV9icmlkZ2UsDQo+ID4gICAgICAgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0ZTsNCj4gPiAgICAgICBzdHJ1Y3QgbXNtX2RwX2Jy
aWRnZSAqZHBfYnJpZGdlID0gdG9fZHBfYnJpZGdlKGRybV9icmlkZ2UpOw0KPiA+ICAgICAgIHN0
cnVjdCBtc21fZHAgKmRwID0gZHBfYnJpZGdlLT5kcF9kaXNwbGF5Ow0KPiA+ICsgICAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7DQo+ID4gKyAgICAgc3RydWN0IGRybV9jb25uZWN0
b3Jfc3RhdGUgKmNvbm5fc3RhdGUgPSBOVUxMOw0KPiA+DQo+ID4gICAgICAgLyoNCj4gPiAgICAg
ICAgKiBDaGVjayB0aGUgb2xkIHN0YXRlIG9mIHRoZSBjcnRjIHRvIGRldGVybWluZSBpZiB0aGUg
cGFuZWwNCj4gPiBAQCAtMTUwLDEwICsxNTIsMjIgQEAgc3RhdGljIHZvaWQgZWRwX2JyaWRnZV9h
dG9taWNfZW5hYmxlKHN0cnVjdA0KPiBkcm1fYnJpZGdlICpkcm1fYnJpZGdlLA0KPiA+DQo+ID4g
ICAgICAgaWYgKG9sZF9jcnRjX3N0YXRlICYmIG9sZF9jcnRjX3N0YXRlLT5zZWxmX3JlZnJlc2hf
YWN0aXZlKSB7DQo+ID4gICAgICAgICAgICAgICBkcF9kaXNwbGF5X3NldF9wc3IoZHAsIGZhbHNl
KTsNCj4gPiAtICAgICAgICAgICAgIHJldHVybjsNCj4gPiArICAgICAgICAgICAgIGdvdG8gcHNy
X2F3YXJlOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIGRwX2JyaWRnZV9hdG9taWNfZW5h
YmxlKGRybV9icmlkZ2UsIG9sZF9icmlkZ2Vfc3RhdGUpOw0KPiA+ICsNCj4gPiArcHNyX2F3YXJl
Og0KPiA+ICsgICAgIGNvbm5lY3RvciA9DQo+IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jf
Zm9yX2VuY29kZXIoYXRvbWljX3N0YXRlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9icmlkZ2UtPmVuY29kZXIpOw0KPiA+ICsg
ICAgIGlmIChjb25uZWN0b3IpDQo+ID4gKyAgICAgICAgICAgICBjb25uX3N0YXRlID0NCj4gZHJt
X2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShhdG9taWNfc3RhdGUsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25uZWN0b3IpOw0KPiA+ICsNCj4gPiArICAgICBpZiAoY29ubl9zdGF0ZSkgew0KPiA+ICsgICAg
ICAgICAgICAgY29ubl9zdGF0ZS0+c2VsZl9yZWZyZXNoX2F3YXJlID0gZHAtPnBzcl9zdXBwb3J0
ZWQ7DQo+ID4gKyAgICAgfQ0KPiANCj4gTm8gbmVlZCB0byB3cmFwIGEgc2luZ2xlIGxpbmUgc3Rh
dGVtZW50IGluIGJyYWNrZXRzLg0KPiANCj4gPiArDQo+ID4gICB9DQo+ID4NCj4gPiAgIHN0YXRp
YyB2b2lkIGVkcF9icmlkZ2VfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmRybV9i
cmlkZ2UsDQo+ID4gQEAgLTE2NCw2ICsxNzgsMTQgQEAgc3RhdGljIHZvaWQgZWRwX2JyaWRnZV9h
dG9taWNfZGlzYWJsZShzdHJ1Y3QNCj4gZHJtX2JyaWRnZSAqZHJtX2JyaWRnZSwNCj4gPiAgICAg
ICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlID0gTlVMTCwgKm9sZF9jcnRj
X3N0YXRlID0gTlVMTDsNCj4gPiAgICAgICBzdHJ1Y3QgbXNtX2RwX2JyaWRnZSAqZHBfYnJpZGdl
ID0gdG9fZHBfYnJpZGdlKGRybV9icmlkZ2UpOw0KPiA+ICAgICAgIHN0cnVjdCBtc21fZHAgKmRw
ID0gZHBfYnJpZGdlLT5kcF9kaXNwbGF5Ow0KPiA+ICsgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3I7DQo+ID4gKyAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5f
c3RhdGUgPSBOVUxMOw0KPiA+ICsNCj4gPiArICAgICBjb25uZWN0b3IgPQ0KPiBkcm1fYXRvbWlj
X2dldF9vbGRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKGF0b21pY19zdGF0ZSwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fYnJpZGdl
LT5lbmNvZGVyKTsNCj4gPiArICAgICBpZiAoY29ubmVjdG9yKQ0KPiA+ICsgICAgICAgICAgICAg
Y29ubl9zdGF0ZSA9DQo+IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoYXRvbWlj
X3N0YXRlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29ubmVjdG9yKTsNCj4gPg0KPiA+ICAgICAgIGNydGMgPSBkcm1f
YXRvbWljX2dldF9vbGRfY3J0Y19mb3JfZW5jb2RlcihhdG9taWNfc3RhdGUsDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9icmlkZ2UtPmVu
Y29kZXIpOw0KPiA+IEBAIC0xOTAsNiArMjEyLDkgQEAgc3RhdGljIHZvaWQgZWRwX2JyaWRnZV9h
dG9taWNfZGlzYWJsZShzdHJ1Y3QNCj4gZHJtX2JyaWRnZSAqZHJtX2JyaWRnZSwNCj4gPiAgICAg
ICAgKiB3aGVuIGRpc3BsYXkgZGlzYWJsZSBvY2N1cnMgd2hpbGUgdGhlIHNpbmsgaXMgaW4gcHNy
IHN0YXRlLg0KPiA+ICAgICAgICAqLw0KPiA+ICAgICAgIGlmIChuZXdfY3J0Y19zdGF0ZS0+c2Vs
Zl9yZWZyZXNoX2FjdGl2ZSkgew0KPiA+ICsgICAgICAgICAgICAgaWYgKGNvbm5fc3RhdGUpDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbm5fc3RhdGUtPnNlbGZfcmVmcmVzaF9hd2FyZSA9
IGZhbHNlOw0KPiA+ICsNCj4gPiAgICAgICAgICAgICAgIGRwX2Rpc3BsYXlfc2V0X3BzcihkcCwg
dHJ1ZSk7DQo+ID4gICAgICAgICAgICAgICByZXR1cm47DQo+ID4gICAgICAgfSBlbHNlIGlmIChv
bGRfY3J0Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSkgew0KPiANCj4gLS0NCj4gV2l0aCBi
ZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0KVGhhbmtzLA0KVmlub2QgUC4NCg0K
