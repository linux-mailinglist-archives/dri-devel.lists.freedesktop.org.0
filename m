Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0CB6D0843
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347310EE8B;
	Thu, 30 Mar 2023 14:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04B10EE8A;
 Thu, 30 Mar 2023 14:27:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32UER4kg013832; Thu, 30 Mar 2023 14:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=a/jm9AF3UTYpum11MeUy8PSUSROmxoNcInD8E9L2ZSM=;
 b=gNfuB1TOmMBuzw3JJ1Zll5Pc+yjgkeEIbkgPVuk2oukjNY/+ifL7ubqy5B5ttetRfRxw
 PTcKtydDgUfxxQOq+uSS0fp19hKuW83Up4pXte2svhgqfCEvrFUyKHpoRU6vWafmYX/E
 BoNCdNHB0+9WgTa21ftFgBKCmXhEjVPSh9a8Nb8+mhLUND48C40mdaoouDgHLxVCJhX1
 TPi7+19JNNNOhqWW1uEq4LFRXyrn7hg+YdLCl7umBo79Qs2dGbkeIXz2gXaq76YVi9ua
 l+addRiFeI+AK9Fq1UA+77+Tnna0gAzxlna4tL1MB7OEjWhzYpuEAm4UA9j69FIYMVT0 mg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmq95bdh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Mar 2023 14:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UThSvLTrWjBfPbhyanOx3h85Gg8/y4Yu48L26lp1p4aesiBqXTGXWvqeKkxwaF8b4dc1UWd5rp2BOTZ+lKT0+F1FsUXUKSY0GXjaLTwxCjA27++XVrXbdjVUVfa3mQZ3xmbY/qb+dfY7UWLY00MNVxsh4mjVepwhWiloe5O463+cNSN0DMO4Q/jNMU87HiQVNKWLMnnLArztDgwqNvt5K74J4A0kGX38BwfRVQ5UlJGN8U34nSdEMJWnnPETB6+z4ZShFVAAtfWUbHAfZdyT6wlYO3tcP0aw+n+gCsHb5xHb1VV5LENT0QBO8uGxjrBSKR4Vj/PDXd7hoV9aVq3ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/jm9AF3UTYpum11MeUy8PSUSROmxoNcInD8E9L2ZSM=;
 b=ZLSxvNFA0hmxTA0ESZoLj3yCyfBFGWA7mcBoJVDe/JvjI5DBe2HyV8WY8DdpSu+9cfgMt61d3Z0rGVBqxD/Z/+5Z/bPB2qqoc9QQi8f0WpPNbg+7wIVebQOqRS+znc0dMmSAl3g7pSn4pcZjqQAj2Lo4TNHMrI+Ffxu5sK9WXDGroQlwBW9UsOc0KQ53z22irXDDFyT6fqMHT7eiByEOgtZwK/3uNjwOmxFqSKCQPrCjo+0XW1zh3jSVaR60m//v1RDY3n6ls3vGppfMiheY2poKvSEkAalb7grJ68SjeWRhA6CPMi/+v0YJkKXAryrn7NHNfow3PQGSg1GJjTmEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by BN0PR02MB7935.namprd02.prod.outlook.com (2603:10b6:408:165::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 14:27:29 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5%2]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 14:27:29 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Subject: RE: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR
 support
Thread-Topic: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on
 PSR support
Thread-Index: AQHZTSTsb2JCdFx7o0SY2y5fDPNNi68NZWaAgAACYwCAAZAAgIADD/oggAAJk4CAAXrQAIAAAKkw
Date: Thu, 30 Mar 2023 14:27:28 +0000
Message-ID: <BN0PR02MB8173D63F80E708A85E745C5CE48E9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
 <20230326162723.3lo6pnsfdwzsvbhj@ripper>
 <20230326163556.iesjkoh3nw3iwvf2@ripper>
 <CAE-0n520ypTRNT1X6kZ8o_Z+DN_68qwqZc1wZGMwsFqV5naktw@mail.gmail.com>
 <BN0PR02MB81736AFC01FB13F1640068CEE4899@BN0PR02MB8173.namprd02.prod.outlook.com>
 <CAD=FV=UjHiEk==KAhbx6QFW++69vDAM44sw-b2MGcJ7NsfbF-A@mail.gmail.com>
 <CAD=FV=V7UoA5jP-ANFMNzm3oLbYmT73uDnqs0oKHKb16-NcULg@mail.gmail.com>
In-Reply-To: <CAD=FV=V7UoA5jP-ANFMNzm3oLbYmT73uDnqs0oKHKb16-NcULg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|BN0PR02MB7935:EE_
x-ms-office365-filtering-correlation-id: ca03380b-c62d-474a-5b16-08db312ae436
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: llV5plsVp/y/OXNdQpHzV/NSSf2Dv601tL6AF+WIe7qX2jUmsWL9966VHBi2deGO11Waderh1CPTzOR0TzLmryP3GV2t2TUxvXJowpzS2K1xsTfxmsBLUw86+zcadhiZyo8wAx1z/gGv7GhzL8ciz/5qCLegdARXvtvD8kAJysra8gEkE9l38vN5DhyFRg1uUBcZ0vuvZrz2jznf0Kif7nmANqQvg5xpof8ZbXu5hkWMlpkomH88/71Lygy6DqK7RhZ19aii5VLVCiZStzj8AyJ4YgXedt9AjlEn/W0VumWOxAHLwSHkdbK9PaVKX0sunr3IB8n905HcH7dcn7TpoJGBIiy2VsUKXbN1V2uxv1+VK1TWyuuU6RGkubmuaKTsCgF/wPasxJtfxTXdlixKF1jsW8m1JsIbchU9fl5GMsA4Vs/04rFRDWJzOsGPbTQKwOKcYilHtgR7/AyAPCjeZbyoSHPSw3yK6+pC86NBhpqU1M7KOf3v2fk8KIpGy87AGZbZJDlhMRsquRgdF+mgT7QhXjL4erfdNP1995YPg+u4ReFumcpMY5Sw6UIbyz2nvaHRlWDFaHLAWnzYZad76gbscQYcCgsHfT2AG3QztwO3Rt7iUrf51vOjiwvEmvAC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199021)(83380400001)(316002)(76116006)(38100700002)(7696005)(66946007)(107886003)(122000001)(53546011)(66556008)(54906003)(26005)(6506007)(2906002)(478600001)(186003)(7416002)(5660300002)(9686003)(86362001)(64756008)(6916009)(55016003)(41300700001)(33656002)(8936002)(66476007)(8676002)(52536014)(4326008)(66446008)(38070700005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmxObzJoOGlGQnl0MHVaZGQ2WDVTeDlCdk9USTUxTlQ5c283dTdTRGdNdGIy?=
 =?utf-8?B?cmtIMmI3RHNsQjFyWWQ4SWdLcU9peEdPMDYxNzQ2SzZEczBTd3U2YVF6M0sw?=
 =?utf-8?B?N2IzSEJ5cWo5dEM2cmpoTUR3TU9rZFdrV0RMNnRkc3hITjU0TVBHRXJrNjRx?=
 =?utf-8?B?U0hwTlptckRxZFlWbkdHTHBzdVA4ZlBRVnkwL0xsZ2kvNXBTQUcyZGk4N2dD?=
 =?utf-8?B?NFN4Nm1NZE45UU00Q00rRmtJNjRlQ1JBK1FaYVQ1c0U5N3dqV0EvZE5TRFc5?=
 =?utf-8?B?eTJteS93b0FrTnZNUDlVWGFrQzlnUFhoMDBFcTJnOGJEbW1hM2RRbk1WRjc5?=
 =?utf-8?B?V3dJbGI1VkQ1ZFVTeU5qeGNmKzRORFV2WU8yTW5sbEFrWUkzWFlMQVZNK0U5?=
 =?utf-8?B?NEdPTXd6K2RlOWNBZ1pGR2t5dXoxT0k0Z28rbnZreU9Pc1BvSUhGZTFsN09p?=
 =?utf-8?B?OE5NenltNHVzWmtSdCtXZDBJYnpwN0VJSDZMM21EQmZraktoRTlDdUZ3Qnpq?=
 =?utf-8?B?TEwreldHSEwrWXlkeEtvQ0JDb0x6YUZ2akQ5WEpWdkJKek9SUUZZRUtGYjBa?=
 =?utf-8?B?aWh1ckc2d085VW9tT1lNZTZGY1FGL3NzbFlRRjJxVGVxc2pYekxUaWR1b2VL?=
 =?utf-8?B?QmxzU2NJTktnWkNYZXdJUVNwQjhjaFV5bmdZbk44M05pckhuY1NleVNMbHBH?=
 =?utf-8?B?TFZxR2w4S243RCtoS295WUpmdTQxWThDVnFBbXlNTDQ2aEt0U3BmNDZWSnFn?=
 =?utf-8?B?WEt3UGVqWUpzWmJLQmZQN3JuZkhzNzkzZGpYeVc3UUtIRUZVajQ3WlYrTWs1?=
 =?utf-8?B?T3h1dlg2bExDSCtPdWN6blBncEI3bmVaQXFGMmxTS1JqVTU4OGUyME9kZ0lR?=
 =?utf-8?B?czhQemlqcXc4ZHV4VzhlWFFzVVU0dnU4TVVxb09CWW1PUWM0R1czTHBvQ3JD?=
 =?utf-8?B?SzlGZldRRk1ySjc5TExzWjl5cVhiZFF6SFFwbVdEekxNZ3BiVVdyeGIwcDlr?=
 =?utf-8?B?MlcyMGFEeXJyVFRuQ21HWWFEMVcxa3VBdmZ5QUNwZHNjdTEzYlVzMi9zZHVN?=
 =?utf-8?B?cjkxYTgzbzlKMjJXZHlZQktsU0JLUSt5dWd5U0pTTlZhcGF3WjhtbkhRVit6?=
 =?utf-8?B?YlQvZ0VlUDNvdDFHL0ZpSFcxY012eno1NVBpN1M4czZGek5KdjV0N2RRTEJJ?=
 =?utf-8?B?WDdFWTdOQ0d2eFNwc1dLL2J2bENuNTFBZGJOT254dzB6RHA5WjJxdVlZR05R?=
 =?utf-8?B?azBZNnIyY3ZONUxscmRLVXBKdXppdjhSaVdKT1pFTHJRajJXWHQ0TmdLNnZF?=
 =?utf-8?B?WUxhd2pIaXZlWGJRaTNNbDFwWDdxU2c0MkdnT0JSbktMbVQ5VkZiWGVwNFly?=
 =?utf-8?B?ZUdJcVBsOWdrQnhoRURTQ2lObithbUQwV0xkNUhQVStrWkZ2UDcyQ0ZSWEhx?=
 =?utf-8?B?QUNpem9uSHVtNlhxQ0kzVVVBZGppb1pSSmtOUXVEQmZycm85cHNPcXZRa0d3?=
 =?utf-8?B?em12OXRHMHkxWUlBMUpqMi9hckFjbm1OK0JrM2FldGtESTJoQ3JyU0ZUNVRI?=
 =?utf-8?B?OGx0eklWaVdxeDlFZTBjRUpvSU0yTC9lS3loN1N4RUhlZy9ibDA0VVdXUjRk?=
 =?utf-8?B?STZuTkN5UTh4NzF5czhzZzF1bGVwdFVJVXZ1L0ZkY2tuTzFuMCtRbTNVWEw3?=
 =?utf-8?B?QmU0aDErOHcyekNkRVUydGRGZnFDSngxclYya1lyS0w2THUvU01Lb2Y0TndZ?=
 =?utf-8?B?dUhpMlJ0K1hVYW45am5wdEQrMmpXeUszaERBREM5VmhZTHdHWkRjazN1Y01S?=
 =?utf-8?B?RERDNmRHOVlkTmFZSnp1U1VXa2xILzM4UG1na2tkZ2lNRWFkaXVVN0JzcDBR?=
 =?utf-8?B?U0NDekk2bmUxbElTR1JHNHBVWlU1Ykt2UEJvODZKWTVjdXBUVm9lMnVZVTln?=
 =?utf-8?B?L090SDBMR1p1R1JvWDJNZWk4ZFVhQzhxYzgva0F6NXBBYTBzRXIwTkpwT3I0?=
 =?utf-8?B?OEJqTThMcGQwY2pHV2FpRnE1b1pFNWhmbVV2TjZuVHdWUWIvZ0ZXcjZtSDVq?=
 =?utf-8?B?a1ZEdVJ1N3MyTVZCL2E3bnM2NjFDVHgrMXhxb053eEZkRElCb21UNldlbWU1?=
 =?utf-8?Q?CAgfQWGPmnhJ9KioNXs/01Qqa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?NmU4Y2g0WnhnemVQRDVwM2VyZFpCbXhsUUtWOG9vY1NlUXQzTjhSRTMzajlk?=
 =?utf-8?B?cHFPVTdqVUJlbU83N1NBb1g5cERwRUVYQjgrZVhwaFBqUXRFSGFpRE9xazdR?=
 =?utf-8?B?ck1CVHZucThYbEZhMjNwaXZEeE1RdUNFbENQYzE5aXk2Q09OZGwwUkpOak5Y?=
 =?utf-8?B?TEFZZ0Vlc3dtRjdyOU1rcjU3U2tpNmE2RDI2blg2aE1qcitpMlA2MjdtMjh1?=
 =?utf-8?B?eFVPRktNSjBGZm90ZmdlMkNoVVVFYVRZNm9nU1dGZ3pPR0V5Wk55ckdhY1li?=
 =?utf-8?B?dzBCckd6eFYrMVY5ZXhJdTVOUXJUaVQzcDNYdHNqbk5wajBqUlB1K0wvMjAv?=
 =?utf-8?B?bDNEUTJ0Z1dzZFV3Y095dFFZRk1LSEFFeGRYSnEvamMrbm5jU0MzL1lzcmVF?=
 =?utf-8?B?SENGSnJ3aU11eC9Bd3VZdmpQUVVwMnY1VjBKTU1KUWVyYjJtRFRCQmpJZnZM?=
 =?utf-8?B?VWZqbnZLdVU1d2VrK1N5WW1xeWVmUlJ4WDgyRWhXVTNWMkhYcncvdFVKQ0Iy?=
 =?utf-8?B?L2gyOVlpS2lrdTh4VERxNThGSk5ZZytCclJKUnJKU2JKSXpTeFJ2ajRjRFRZ?=
 =?utf-8?B?QWdobXFZTjBhUXpCdVpwQUtZUm4rWkgrNDY3cldiWVJOOVljeEdaWWt1d0Vq?=
 =?utf-8?B?amphWGpTL0hVUXZIa1RPWnBmT0svWUxYUEdRYTB4dUt4d3VMa3VsK1BESFli?=
 =?utf-8?B?M3M3QWFMTDdOSHpGM1MzNVgrVnU1d0pZSzFGSjFhazNNZ2k5WVVIQTQvUCsz?=
 =?utf-8?B?akJwQXhWYStaeVVuTnkxS1RtajNZbHNDdldGOWdPNkxiS3pmWVZtaFc2RG1B?=
 =?utf-8?B?bE84TkdZVVJVQW40OS9xTEVZWHkvN3BaeW5nZDBwTGFSR1RWVFlyUEdkOE4r?=
 =?utf-8?B?b29kUzlHak9kaXhNM2dEdEZCa25LUFlabFFVcFV6WU9ISFZRY0pIRjZBRWFK?=
 =?utf-8?B?bEJqZW8vRXhESnJIM1ByZjJhYjM1aTV0cndOVWtIQlRuUG1DN0haN0QrR2xY?=
 =?utf-8?B?M05xZ3BZRlU1b0xQQkthUE9vV0tWSGN5Kzk4M1J4SUZFRHI5WUpoRWcyL1FB?=
 =?utf-8?B?ek4xYVZWT3laOEJCQU51YVllblNZTjRmMG0vSGZkU3M0b1crSTVaR1Y4WXk2?=
 =?utf-8?B?cFdmSGhFYTBZa3BKbUpGSHA1RlkwNm9MWjczc0V1RHR6SDNDVXlmQXJwakla?=
 =?utf-8?B?R1M1ZDRrcnROdEtqaEpqamlJR042VktpZlk4cWRuY1I2L2JlZVBKMlYzalRU?=
 =?utf-8?B?dGNGTG5CaDFpTWQ0S0JuUlAzampoKzB6QkJFeE9wVitNeUJtZz09?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca03380b-c62d-474a-5b16-08db312ae436
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 14:27:28.9718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zc2iIoYPqqD5deo0onNeDvKIoWlRzdTceVZAMfpDULMegLAN787hVdVtSzsIZuGbjfI8AbUq3FeO5eF3cWjMwXP1z8tNWPROM3ssof2rzvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7935
X-Proofpoint-GUID: 5tfwFVEyrbklBJIyD36tJ5CF02O2d2nf
X-Proofpoint-ORIG-GUID: 5tfwFVEyrbklBJIyD36tJ5CF02O2d2nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300113
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMzAsIDIwMjMg
Nzo1NCBQTQ0KPiBUbzogVmlub2QgUG9saW1lcmEgPHZwb2xpbWVyQHF0aS5xdWFsY29tbS5jb20+
DQo+IENjOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+OyBCam9ybiBBbmRlcnNz
b24NCj4gPGFuZGVyc3NvbkBrZXJuZWwub3JnPjsgVmlub2QgUG9saW1lcmEgKFFVSUMpDQo+IDxx
dWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPjsgcm9iZGNsYXJrQGdtYWlsLmNvbTsgZHJpLQ0KPiBk
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3Jn
Ow0KPiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEthbHlhbiBUaG90YSAo
UVVJQykgPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT47DQo+IGRtaXRyeS5iYXJ5c2hrb3ZAbGlu
YXJvLm9yZzsgS3VvZ2VlIEhzaWVoIChRVUlDKQ0KPiA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+
OyBWaXNobnV2YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+IDxxdWljX3Zwcm9kZHV0QHF1aWNp
bmMuY29tPjsgQmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA8cXVpY19iam9yYW5kZUBxdWljaW5j
LmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+IDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29t
PjsgU2Fua2VlcnRoIEJpbGxha2FudGkgKFFVSUMpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNCAxNC8xNF0gZHJtL21zbS9kcDogc2V0IHNl
bGYgcmVmcmVzaCBhd2FyZSBiYXNlZA0KPiBvbiBQU1Igc3VwcG9ydA0KPiANCj4gDQo+IEhpLA0K
PiANCj4gT24gV2VkLCBNYXIgMjksIDIwMjMgYXQgODo0N+KAr0FNIERvdWcgQW5kZXJzb24NCj4g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IE9u
IFdlZCwgTWFyIDI5LCAyMDIzIGF0IDg6MTbigK9BTSBWaW5vZCBQb2xpbWVyYQ0KPiA+IDx2cG9s
aW1lckBxdGkucXVhbGNvbW0uY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogU3RlcGhlbiBCb3lk
IDxzd2JveWRAY2hyb21pdW0ub3JnPg0KPiA+ID4gPiBTZW50OiBNb25kYXksIE1hcmNoIDI3LCAy
MDIzIDk6NTggUE0NCj4gPiA+ID4gVG86IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5l
bC5vcmc+OyBWaW5vZCBQb2xpbWVyYSAoUVVJQykNCj4gPiA+ID4gPHF1aWNfdnBvbGltZXJAcXVp
Y2luYy5jb20+DQo+ID4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBs
aW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+ID4gZnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiA+ID4g
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVy
c0BjaHJvbWl1bS5vcmc7DQo+ID4gPiA+IEthbHlhbiBUaG90YSAoUVVJQykgPHF1aWNfa2FseWFu
dEBxdWljaW5jLmNvbT47DQo+ID4gPiA+IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsgS3Vv
Z2VlIEhzaWVoIChRVUlDKQ0KPiA+ID4gPiA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+OyBWaXNo
bnV2YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+ID4gPiA+IDxxdWljX3Zwcm9kZHV0QHF1aWNp
bmMuY29tPjsgQmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA+ID4gPiA8cXVpY19iam9yYW5kZUBx
dWljaW5jLmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+ID4gPiA+IDxxdWljX2FiaGluYXZr
QHF1aWNpbmMuY29tPjsgU2Fua2VlcnRoIEJpbGxha2FudGkgKFFVSUMpDQo+ID4gPiA+IDxxdWlj
X3NiaWxsYWthQHF1aWNpbmMuY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNCAx
NC8xNF0gZHJtL21zbS9kcDogc2V0IHNlbGYgcmVmcmVzaCBhd2FyZQ0KPiBiYXNlZA0KPiA+ID4g
PiBvbiBQU1Igc3VwcG9ydA0KPiA+ID4gPg0KPiA+ID4gPiBRdW90aW5nIEJqb3JuIEFuZGVyc3Nv
biAoMjAyMy0wMy0yNiAwOTozNTo1NikNCj4gPiA+ID4gPiBPbiBTdW4sIE1hciAyNiwgMjAyMyBh
dCAwOToyNzoyM0FNIC0wNzAwLCBCam9ybiBBbmRlcnNzb24gd3JvdGU6DQo+ID4gPiA+ID4gPiBP
biBUaHUsIE1hciAwMiwgMjAyMyBhdCAxMDowMzoxN1BNICswNTMwLCBWaW5vZCBQb2xpbWVyYSB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gRm9yIHRoZSBQU1IgdG8ga2ljayBpbiwgc2VsZl9yZWZyZXNo
X2F3YXJlIGhhcyB0byBiZSBzZXQuDQo+ID4gPiA+ID4gPiA+IEluaXRpYWxpemUgaXQgYmFzZWQg
b24gdGhlIFBTUiBzdXBwb3J0IGZvciB0aGUgZURQIGludGVyZmFjZS4NCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBXaGVuIEkgYm9vdCBteSBzYzgyODB4cCBkZXZpY2Vz
IChDUkQgYW5kIFgxM3MpIHRvIGNvbnNvbGUgd2l0aA0KPiB0aGlzDQo+ID4gPiA+ID4gPiBwYXRj
aCBpbmNsdWRlZCBJIGdldCBhIGxvZ2luIHByb21wdCwgYW5kIHRoZW4gdGhlcmUgYXJlIG5vIG1v
cmUNCj4gc2NyZWVuDQo+ID4gPiA+ID4gPiB1cGRhdGVzLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IFN3aXRjaGluZyB2aXJ0dWFsIHRlcm1pbmFsIChjdHJsK2FsdCtmTikgY2F1c2VzIHRoZSBz
Y3JlZW4gdG8gcmVkcmF3Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEJsaW5kbHkgbG9naW4g
aW4gYW5kIGxhdW5jaGluZyBXYXlsYW5kIHdvcmtzIGFuZCBmcm9tIHRoZW4gb24NCj4gc2NyZWVu
DQo+ID4gPiA+ID4gPiB1cGRhdGVzIHdvcmtzIGFzIGV4cGVjdGVkLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IFN3aXRjaGluZyBmcm9tIFdheWxhbmQgdG8gYW5vdGhlciB2aXJ0dWFsIHRlcm1p
bmFsIGNhdXNlcyB0aGUNCj4gcHJvYmxlbQ0KPiA+ID4gPiB0bw0KPiA+ID4gPiA+ID4gcmUtYXBw
ZWFyLCBubyB1cGRhdGVzIGFmdGVyIHRoZSBpbml0aWFsIHJlZnJlc2gsIHN3aXRjaGluZyBiYWNr
IGdvIHRoZQ0KPiA+ID4gPiA+ID4gV2F5bGFuZC10ZXJtaW5hbCBjcmFzaGVkIHRoZSBtYWNoaW5l
Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFsc28sIHRyeWluZyB0byBicmlu
ZyB0aGUgZURQLXNjcmVlbiBiYWNrIGZyb20gRFBNUyBnaXZlcyBtZToNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IDwzPlsgMjM1NS4yMTgwOTldIFtkcm06ZHBfY2F0YWxvZ19jdHJsX3NldF9wYXR0ZXJu
X3N0YXRlX2JpdA0KPiBbbXNtXV0NCj4gPiA+ID4gKkVSUk9SKiBzZXQgc3RhdGVfYml0IGZvciBs
aW5rX3RyYWluPTEgZmFpbGVkDQo+ID4gPiA+ID4gPDM+WyAyMzU1LjIxODkyNl0gW2RybTpkcF9j
dHJsX3NldHVwX21haW5fbGluayBbbXNtXV0gKkVSUk9SKg0KPiBsaW5rDQo+ID4gPiA+IHRyYWlu
aW5nICMxIGZhaWxlZC4gcmV0PS0xMTANCj4gPiA+ID4gPiA8Mz5bIDIzNTUuMjYyODU5XSBbZHJt
OmRwX2NhdGFsb2dfY3RybF9zZXRfcGF0dGVybl9zdGF0ZV9iaXQNCj4gW21zbV1dDQo+ID4gPiA+
ICpFUlJPUiogc2V0IHN0YXRlX2JpdCBmb3IgbGlua190cmFpbj0xIGZhaWxlZA0KPiA+ID4gPiA+
IDwzPlsgMjM1NS4yNjM2MDBdIFtkcm06ZHBfY3RybF9zZXR1cF9tYWluX2xpbmsgW21zbV1dICpF
UlJPUioNCj4gbGluaw0KPiA+ID4gPiB0cmFpbmluZyAjMSBmYWlsZWQuIHJldD0tMTEwDQo+ID4g
PiA+ID4gPDM+WyAyMzU1LjMwNTIxMV0gW2RybTpkcF9jYXRhbG9nX2N0cmxfc2V0X3BhdHRlcm5f
c3RhdGVfYml0DQo+IFttc21dXQ0KPiA+ID4gPiAqRVJST1IqIHNldCBzdGF0ZV9iaXQgZm9yIGxp
bmtfdHJhaW49MSBmYWlsZWQNCj4gPiA+ID4gPiA8Mz5bIDIzNTUuMzA1OTU1XSBbZHJtOmRwX2N0
cmxfc2V0dXBfbWFpbl9saW5rIFttc21dXSAqRVJST1IqDQo+IGxpbmsNCj4gPiA+ID4gdHJhaW5p
bmcgIzEgZmFpbGVkLiByZXQ9LTExMA0KPiA+ID4gPiA+IDwzPlsgMjM1NS4zNDUyNTBdIFtkcm06
ZHBfY2F0YWxvZ19jdHJsX3NldF9wYXR0ZXJuX3N0YXRlX2JpdA0KPiBbbXNtXV0NCj4gPiA+ID4g
KkVSUk9SKiBzZXQgc3RhdGVfYml0IGZvciBsaW5rX3RyYWluPTEgZmFpbGVkDQo+ID4gPiA+ID4g
PDM+WyAyMzU1LjM0NjAyNl0gW2RybTpkcF9jdHJsX3NldHVwX21haW5fbGluayBbbXNtXV0gKkVS
Uk9SKg0KPiBsaW5rDQo+ID4gPiA+IHRyYWluaW5nICMxIGZhaWxlZC4gcmV0PS0xMTANCj4gPiA+
ID4gPiA8Mz5bIDIzNTUuNDA1NjUwXSBbZHJtOmRwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGlnaCBb
bXNtXV0NCj4gKkVSUk9SKg0KPiA+ID4gPiBmYWlsZWQgdG8gY29tcGxldGUgRFAgbGluayB0cmFp
bmluZw0KPiA+ID4gPiA+IDwzPlsgMjM1NS42Njg5ODhdDQo+ID4gPiA+IFtkcm06ZHB1X2VuY29k
ZXJfcGh5c192aWRfd2FpdF9mb3JfY29tbWl0X2RvbmU6NDg4XSBbZHB1DQo+ID4gPiA+IGVycm9y
XXZibGFuayB0aW1lb3V0DQo+ID4gPiA+ID4gPDM+WyAyMzU1LjY2OTAzMF0gW2RybTpkcHVfa21z
X3dhaXRfZm9yX2NvbW1pdF9kb25lOjUxMF0gW2RwdQ0KPiA+ID4gPiBlcnJvcl13YWl0IGZvciBj
b21taXQgZG9uZSByZXR1cm5lZCAtMTEwDQo+ID4gPiA+ID4gPDM+WyAyMzU1LjY5OTk4OV0gW2Ry
bTpkcHVfZW5jb2Rlcl9mcmFtZV9kb25lX3RpbWVvdXQ6MjM5OF0NCj4gW2RwdQ0KPiA+ID4gPiBl
cnJvcl1lbmMzNSBmcmFtZSBkb25lIHRpbWVvdXQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFuZCB0
aGVuIHRoZSBtYWNoaW5lIGp1c3QgcmVzZXRzLg0KPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+
IEkgc2F3IHNpbWlsYXIgYmVoYXZpb3Igb24gQ2hyb21lT1MgYWZ0ZXIgd2UgcGlja2VkIHRoZSBQ
U1IgcGF0Y2hlcw0KPiBpbnRvDQo+ID4gPiA+IG91ciBrZXJuZWwuIEkgc3VzcGVjdCBpdCdzIHRo
ZSBzYW1lIHByb2JsZW0uIEkgc3dpdGNoZWQgYmFjayBhbmQgZm9ydGgNCj4gPiA+ID4gYmV0d2Vl
biBWVDIgYW5kIHRoZSBPT0JFIHNjcmVlbiB3aXRoIGN0cmwrYWx0K2ZvcndhcmQgYW5kIHRoYXQN
Cj4gc2hvd2VkDQo+ID4gPiA+IHdoYXQgSSB0eXBlZCBvbiB0aGUgdmlydHVhbCB0ZXJtaW5hbCBh
ZnRlciBzd2l0Y2hpbmcgYmFjayBhbmQgZm9ydGguDQo+ID4gPiA+IEl0J3MgbGlrZSB0aGUgcmVk
cmF3IG9ubHkgaGFwcGVucyBvbmNlIG9uIHRoZSBzd2l0Y2ggYW5kIG5ldmVyIGFnYWluLiBJDQo+
ID4gPiA+IHN3aXRjaGVkIGJhY2sgYW5kIGZvcnRoIGVub3VnaCB0aW1lcyB0aGF0IGl0IGV2ZW50
dWFsbHkgY3Jhc2hlZCB0aGUNCj4gPiA+ID4ga2VybmVsIGFuZCByZWJvb3RlZC4gVGhpcyB3YXMg
b24gQ1JEIChzYzcyODAtaGVyb2JyaW5lLWNyZC5kdHMpLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGVy
ZSdzIGFuIGFuaW1hdGlvbiBvbiB0aGUgT09CRSBzY3JlZW4gdGhhdCBpcyB3b3JraW5nIHRob3Vn
aCwgc28NCj4gPiA+ID4gcGVyaGFwcyBQU1IgaXMgd29ya2luZyB3aXRoIHRoZSBjaHJvbWUgY29t
cG9zaXRvciBidXQgbm90IHRoZSB2aXJ0dWFsDQo+ID4gPiA+IHRlcm1pbmFsPyBJIGhhdmVuJ3Qg
aW52ZXN0aWdhdGVkLg0KPiA+ID4NCj4gPiA+IEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZSB3aGVyZSBpbiB2aXJ0dWFsIHRlcm1pbmFsLCBJIGRvbid0IHNlZQ0KPiBhbnkgc2NyZWVu
IHJlZnJlc2ggZGVzcGl0ZSB0eXBpbmcgaW4uDQo+ID4gPiBJbiB0aGUgVlQgbW9kZSwgSSBzZWUg
dGhhdCBQU1IgaXMgZW50ZXJlZCwgYnV0IGRlc3BpdGUgdHlwaW5nIGluIHRoZXJlIGFyZQ0KPiBu
byBhdG9taWMgY29tbWl0cyB0cmlnZ2VyZWQsIGhlbmNlIHRoZSBsYXN0IGJ1ZmZlciB3YXMgYWx3
YXlzIHJlZnJlc2hlZC4NCj4gPiA+DQo+ID4gPiBRdWVyaWVzIGZyb20gbXkgc2lkZSB0byBSb2Ig
JiBEb3VnOg0KPiA+ID4gMSkgSW4gVlQgbW9kZSwgZG9lcyB0aGUgZnJhbWV3b3JrIG9wZXJhdGVz
IGluIHNpbmdsZSBidWZmZXIgbW9kZQ0KPiB3aXRob3V0IGFueSBjb21taXQgZm9yIG5ldyB1cGRh
dGVzID8NCj4gPiA+IDIpIGlmIGFib3ZlIGlzIHRydWUgdGhlbiwgaG93IGRvZXMgZHJpdmVyIGtu
b3cgaWYgdGhlIGZyYW1ld29yayBvcGVyYXRlcw0KPiBpbiBzaW5nbGUgYnVmZmVyIG1vZGUsIHRv
IG1ha2UgYW55IGFwcHJvcHJpYXRlIGFjdGlvbg0KPiA+ID4gMykgd2hhdCBpcyB0aGUgZXhwZWN0
ZWQgYmVoYXZpb3Igd2l0aCB0aGUgZHJpdmVyIGhlcmUgPyBzaG91bGQgaXQgcmV0dXJuDQo+IGF0
b21pY19jaGVjayBmYWlsdXJlLCBmb3Igc2luZ2xlIGJ1ZmZlciBtb2RlIG9wZXJhdGlvbiBvciwg
aXQgc2hvdWxkIGV4aXQgUFNSID8NCj4gPiA+IDQpIGlzIHRoZXJlIGFueSBISU5UIHBhc3NlZCBk
b3duIHRvIHRoZSBkcml2ZXIgc28gdGhhdCB3ZSBjYW4gYmFuayBvbiBpdA0KPiBhbmQgYWN0IGFj
Y29yZGluZ2x5Pw0KPiA+DQo+ID4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGlzIGRldGFpbCBhYm91
dCBQU1IgYmVmb3JlLCBhbmQgSSBsZWZ0IG15DQo+ID4gUFNSLWVuYWJsZWQgZGV2aWNlIGF0IGhv
bWUgc28gSSBjYW4ndCBlYXNpbHkgdGVzdCB0aGlzIHJpZ2h0IG5vdy4gVGhhdA0KPiA+IGJlaW5n
IHNhaWQsIGZyb20gYSBiaXQgb2Ygc2VhcmNoaW5nIEkgd291bGQgZ3Vlc3MgdGhhdA0KPiA+IG1z
bV9mcmFtZWJ1ZmZlcl9kaXJ0eWZiKCkgaXMgc29tZWhvdyBpbnZvbHZlZCBoZXJlLiBBcmUgdGhp
bmdzIGJldHRlcg0KPiA+IGlmIHlvdSBnZXQgcmlkIG9mIHRoZSB0ZXN0IGFnYWluc3QgJ21zbV9m
Yi0+ZGlydHlmYic/DQo+ID4NCj4gPiBJIGF0IGxlYXN0IHVzZWQgZnRyYWNlIHRvIGNvbmZpcm0g
dGhhdCBvbiBhIGRpZmZlcmVudCBkZXZpY2UNCj4gPiBtc21fZnJhbWVidWZmZXJfZGlydHlmYigp
IGlzIG5vdCBjYWxsZWQgZHVyaW5nIG5vcm1hbCBDaHJvbWVPUyB1c2FnZQ0KPiA+IGJ1dCBpdCBf
aXNfIGNhbGxlZCBpbiBWVDIgdXNhZ2UuDQo+IA0KPiBJbmRlZWQsIEkgY2FuIGNvbmZpcm0gdGhh
dCBpZiBJIGNvbW1lbnQgb3V0IHRoZSB0ZXN0IGluDQo+IG1zbV9mcmFtZWJ1ZmZlcl9kaXJ0eWZi
KCkgYW5kIGp1c3QgY2FsbCBzdHJhaWdodCB0aHJvdWdoIHRvDQo+IGRybV9hdG9taWNfaGVscGVy
X2RpcnR5ZmIoKSB0aGF0IHR5cGluZyBvbiBWVDIgd29ya3MgZmluZS4NCj4gDQo+IC4uLnNvIHBy
ZXN1bWFibHkgeW91IG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gZ2V0ICJkaXJ0eWZiIiBzZXQN
Cj4gcHJvcGVybHkgd2hlbiB5b3UgaGF2ZSBhIFBTUi1lbmFibGVkIHBhbmVsIG9yIG1heWJlIHdo
ZW5ldmVyIHRoZSBwYW5lbA0KPiBlbnRlcnMgUFNSIG1vZGU/DQo+IA0KSSBoYXZlIGFsc28gb2Jz
ZXJ2ZWQgdGhlIHNhbWUgYW5kIEkgYW0gd29ya2luZyBvbiBmaXhpbmcgaXQuDQoNClRoYW5rcywN
ClZpbm9kIFAuDQoNCj4gLURvdWcNCg==
