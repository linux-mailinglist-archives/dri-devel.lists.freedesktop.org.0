Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9005F1CB3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2682E10E371;
	Sat,  1 Oct 2022 14:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D9310E371;
 Sat,  1 Oct 2022 14:25:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 291DuVgf030274;
 Sat, 1 Oct 2022 14:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=NOzEXlmdoOOZvAGX8QPsImMdD6vhTYUuQhd49gG1JTg=;
 b=SkEasspBcrKYnhr1Eb4RUv2rAEcBesd9FrP4+sOhn0Pev4SJILvt92micXNG05bg35+H
 cX058v+m69gR4WWZjWNmB5UUBaZLqHvZs5TKez77nk0BMjBQ/oYlwdZM/XjKmRjA0TtM
 DrMX2G8N2C7GfY2S9eYtp+O5YlG+8ifwY7Ez7htIyzaGGN+36vl9+xo2HzNzdx4h61OV
 xCUOyYZWSQ5p2cmuFra1hrrvn48tJTheQAt/Zi+DTMh9R2DlsiAXih9tyHvEBdrknL1G
 mXejBLMR7o9Y1m2QkHigVKMGSUC+/PKNWJ1gEeYOhGQxMr+mcZ3A6KXjqgsqe/aZ75do fg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxcjf8sgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Oct 2022 14:25:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6vJ3WN82nRmJi+ZLlHHzvL1jOtgaNktraxrmotRvHf9ihE4vjAl/TGPMnZMjb6rcg7IHjgr+pdp2J2AYDyyu6w+8zaShHYyDQgnclUYPvMPo+TY2nfhRNGQKu0/iZbJZMpHk/oL1Wl4nIrFv10JBUB3EROtGLLA+O4+d9dF1HareHNp3tSOFph56xRwq+e/PChFJ2KrzMd+b8XmFDanAQtmFhjRD1zLQsi3GVC3rcf+i4Lwrhp/rAO5bPVZXhY6TjZRWec+GFQQvK1RoGVIw45BbEkI7xYg7HKu3Akr0xbgIh3cxXP4WENR7kUjiTFfxLf4fQziywK4oMLlvhS9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOzEXlmdoOOZvAGX8QPsImMdD6vhTYUuQhd49gG1JTg=;
 b=QSB3CYOmDSDkffRMSh51dj/hkCej3jMBNYHZBXbO7IBONdO8ePS4Edg+kbipI1t9MCJLC2msjZlRygS1YsEzmm4j6rPp7RlxOTFqL8NXETHjW+5NF8k7l0pS6gIRaeIiWucn6l3uL6696Wr0MW0/dItlhljzPncXvaguMk1Fxs2rsZrA8iQ+d1F5kA1z0W0PF4mWzSChvgfGE/NwKUgP7qttJCcFP+Il8SNonoklwIpbV1QwKc9b3xjP0kfnebuKAXbraitkSHBVh9h+ALitruoHVrbZSAiaw7qK9+1Hmz3xwEm3IYnjFSNvxJA+jcw+Qzk31TN91SpYjwN2JwNfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by CH0PR02MB8194.namprd02.prod.outlook.com (2603:10b6:610:ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Sat, 1 Oct
 2022 14:25:39 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::60f2:dd20:67dc:8baf]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::60f2:dd20:67dc:8baf%9]) with mapi id 15.20.5676.023; Sat, 1 Oct 2022
 14:25:39 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, Doug Anderson
 <dianders@chromium.org>, "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>
Subject: RE: [v5] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Thread-Topic: [v5] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Thread-Index: AQHYyDPOpjoPjre25EmObmLl3kX4/a32rGAAgAEQnYCAAfIqoA==
Date: Sat, 1 Oct 2022 14:25:38 +0000
Message-ID: <BN0PR02MB8142577BE680E27952F912A296599@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
 <A446B5C0-1EAA-4A24-8E7B-3C0EB2024026@linaro.org>
In-Reply-To: <A446B5C0-1EAA-4A24-8E7B-3C0EB2024026@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|CH0PR02MB8194:EE_
x-ms-office365-filtering-correlation-id: ab9ebbd7-e417-460c-cc3e-08daa3b8d059
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xcvOZC6T5dI0LlU2KWwxW8kYPgHFx2CsJHzsBXFtjztjFJwGKkP0Xo4LegDUqgxtzHxqHjQ202+yL+JIN6Q0ofqU4D7XQnA3d5ABzQMS3gYW6Pc0Ex+SYE7/gQESDmVbceJnqUlDx/IvQl5vvGPSy6LfxJPEtToOgBwg4THh7TdbaxhRRvLJjwRWrVKKNZCzKtjxZSCD+GSAi/wq6ofDYysfHNegYwDO/7pFd1f2QEdFNyt4zC3V+9m540bsgipVZOb2oskMFF0K0xnXDgJet9SQDx/Fbhjpsl4esorAsW3JZWsk+j3SU6sG/hRpMuTv9q8J0h4RzYhSx+6YqNRNSvPCfOWPQjZltJILj4XAcrhLqwUopKaobV0+en5IKbI4Mghnzw/Re0F+opP9ekaaQ4Ao2cVGYBjBho8hAObgISHc81RpQivCe4axfQ99CJblzWJwyyqNiZKKckyxM9nPM+dBuQ0g5H51Sb/bX7ds0qdYfgNFx6KXQQVBBBLEnTg7D75qKZw4hJRbXVFjYwKNlGF+K5Qm4HuXFguK5B1l0ASqbQ6TSCznoIYT+raNgles3t5BkPPVlcgKQSoWJwGBMziJRjRSGt+UlkdPslH91AzIFx2psPk2udOdWC5+iKhk83llIAiuX95nr561vn9JXtkd2oPdCKf6AlLhNLaehijo+Ig09lZnzMeTAP45+iT+YLMs7DguwgmYlQZ5MTFVSEJ2NNJgAsV6tWVfTxuS6ZjRdKKWJb2y7OpbHVCBf5Rj7rxQaA2yfo0vyFOqIz8o2AtMupm6yOafzsvtJzpAQFKh6byNMHXTCxL2nR/JY/q2p6d0aLLR6lWG3UezIkM2tQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(52536014)(41300700001)(5660300002)(2906002)(107886003)(55016003)(26005)(33656002)(316002)(76116006)(64756008)(38070700005)(66946007)(66476007)(66556008)(54906003)(66446008)(122000001)(8676002)(966005)(71200400001)(478600001)(83380400001)(86362001)(8936002)(6506007)(7696005)(186003)(110136005)(4326008)(9686003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3BTUklrQ2E2eXZIRFVwRjVxV1ZTbWpJZjBHZEVYYmFWWTQzVnhOM1d6aE5D?=
 =?utf-8?B?ZFN4NjBHSWZvdTBkQkJJbU15cE4vT3RJOTJHaVh4VVNtUWg3SkZuWjJSdmJT?=
 =?utf-8?B?SFJXVjhCbVNGc0RxcEllOG5TNGFZZFlsZVdYR0JBZjZkcXd2ekNPMGN6djdH?=
 =?utf-8?B?ZUNBbFFVU0xuUEpjRklPV1JCV0haTGJvemdwT002TTBLNHN3c2t6VG9QaWVM?=
 =?utf-8?B?aVRaU05ubEo4SGxyNDlsNGZUMVpzTnZIeW5mcXliMDBMczZrK21mcnpDUXln?=
 =?utf-8?B?ZGNrcFNoWUg4UzB1aGE0YSt4K1FpVThTMDhVbkxrZTFxZ2lRZmVyZDMzclBu?=
 =?utf-8?B?RVNSMWh4Mmx4N1NoVmVMNjlnaHlzaE41N2wvMUpEWVpRS2JMelhpK28zdFo3?=
 =?utf-8?B?d21JM0t6K0JhNXVWaUxZdVMydUFidVNpdXZyZ1VnN0tjcEh4UlRjNStZMmtN?=
 =?utf-8?B?WW80ZGdUejlwNTdTaitJRUJ5emdPV3FIS0MzbU9XYUZXRG5BVFlnaGQzMXNm?=
 =?utf-8?B?VFR0MTlDdmxXS3hvems1YnVOQmMvVmw1VVdralUzUW41Z1ZDb25IUkVuSkEz?=
 =?utf-8?B?aHZYaUFiVEcvcXdLMUFRN041S0lyeGNlalhuOXM3S2d2VHF3bWhlSGgvZVV2?=
 =?utf-8?B?RGo4WTVNa2UxWjZ0YmdLVG1kVUU1QlV5cjM0QUhIQlhJTU42a3paRGtVeExj?=
 =?utf-8?B?WDNNWmQ5N2VPVHlQcDZ2ekJPSGFnUmlJWTBEaXA0WUpNZHJlMk5QNGNCRHdu?=
 =?utf-8?B?eFNnMG9uaXpmLzlHUG93M3Y3K3c0U1FJOFVYaTJELzBNcFYwUW9rSDd5M2FI?=
 =?utf-8?B?KzdmSVRPejNaYk5pZ2NXSmN2eVdzMUtUMnFFOU5KeURha0VOSFpGOWNmbzcr?=
 =?utf-8?B?VUlsOTcrNjA5MXBEaDRscXFEalJnUzNjZHB3T2JsdHFiUnFwcW9pNXBEVGFH?=
 =?utf-8?B?cWhSYkZGNndBTHljSGM1a25yb1c1aVBFZTlWVk1rTkYzdjl6RFJGVDFaNUxR?=
 =?utf-8?B?dHZqUzdRUzg2Mml2Q0R0ZXBrSUkyd0haaXJ2ZTUzZWRwaXYyZ0E2L2ZCdjFp?=
 =?utf-8?B?NW9jTWg4NFVqT1owTDNkYTBsZFdJdnVGd2t4Qm02TFdRZ21hVFlkKzZSUDlt?=
 =?utf-8?B?cHJLdk11Tm91WDlrTnY3Rms0UHZkYnhwekFiQmhKeno1UUFJTWdBeEtmcVVO?=
 =?utf-8?B?MWlidHRnQURERkgxcVFqamJJLzB3VDNCWGpOUW0zc2RBNkxHNWViVS9wTGdX?=
 =?utf-8?B?K1MwcGp5Uk0zSFJBazdIOHY3bmpoc0QramRTamRIUUppK09WSndjLy9BMFV0?=
 =?utf-8?B?UXFEYmJtWWY2MUpuZ1YxNUlsTzBxQzg5NHZDSUVNTE53UzRLeEhwV3dzbk5w?=
 =?utf-8?B?cC9ySzRBZDVTdTVtQWpGRkN3SEo2ZWVnUklpMlB1Y24zWmhCbGNISWJsWFVo?=
 =?utf-8?B?WEo2TCtpSDBvaWdlM3RyODFoNVBYNHlKeDRmamd2OVBSN3Y0SHdTcWUxZ2ZG?=
 =?utf-8?B?K0svMHUvRUxtN3hIR1ZlQTZoOHl2cTlxamkzYnpuR3FyNzNTTUJqOVBwazJO?=
 =?utf-8?B?SXYzRko2OTFRQWtwZjBnM1o5VFJuYXE0enhqTTVsMllIV2MzYmRaekVxU3hJ?=
 =?utf-8?B?ZGNiOFRYWWhMb3NnUlkrMWZDeExndDliRzNFZkw2RFphbEoxMlZEQWF3RFp0?=
 =?utf-8?B?eWtZMWdYSGJadHA1a1dVSXltSjR3QWw3Mm5tUk1RVDBNZlpaQzgyQXV3OUNV?=
 =?utf-8?B?L0VmeUVnZUxpYnVzYTd5N3lpRlJuYkNzeEIwWGpVL01tNWtwWC95UHZyd1dX?=
 =?utf-8?B?RHVUQldxRFVHRkttQTVHYmlraVk5VUZob0kzN2s5VW40QW9Jd2pWOXRLZ01R?=
 =?utf-8?B?OWNsRGliVHMvcC92czZGL2N3ZERtT2FzOWUwcld0K2VjMWR4MWlwSTVQT2Nw?=
 =?utf-8?B?Vi9rUGw2RExJYTI4UTk1WVhXV1R2V1BNRXE5aDNNMERvMnF2bm52ckM4bStS?=
 =?utf-8?B?OGROVEdEc2N0d1ZzTVhYREpqWmVqcjl3VkZnRFZHZHY2QVA0R1lGT2lHOTZ0?=
 =?utf-8?B?a0UrYlZxRWh2dXZRRnU4Ull0bE9DUi9kSmlLbHpIcDVhWFFjTHdJYmFHdjh4?=
 =?utf-8?B?UkdyK2t3UmFSL0U5Nlo3cGw2MU1xYjNsUitQbWYxZHFUWCsyZzcxN2oydnVK?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ebbd7-e417-460c-cc3e-08daa3b8d059
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2022 14:25:39.1045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wymjVIqS59O/Wz2kDEAtYFzjIr5KNpyYViWbUK1vdVlfLimF5MVVFSuE7/7cctFxvaNU2TaBELELmVBqoSBjzVEg8LbrCPaI0Bc8jPnZ+pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8194
X-Proofpoint-GUID: imDnHIVPh7cHtEI1fG0PPLWr0SyEvRrx
X-Proofpoint-ORIG-GUID: imDnHIVPh7cHtEI1fG0PPLWr0SyEvRrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_08,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210010092
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, "Vinod Polimera
 \(QUIC\)" <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, "y@qualcomm.com" <y@qualcomm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+U2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMzAs
IDIwMjIgMTo1OSBQTQ0KPlRvOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
OyBLYWx5YW4gVGhvdGEgKFFVSUMpDQo+PHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj5DYzog
eUBxdWFsY29tbS5jb207IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz47IGxpbnV4LWFybS0NCj5tc20gPGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnPjsgZnJl
ZWRyZW5vDQo+PGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBvcGVuIGxpc3Q6T1BF
TiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEDQo+REVWSUNFIFRSRUUgQklORElOR1MgPGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnPjsgTEtNTCA8bGludXgtDQo+a2VybmVsQHZnZXIua2VybmVsLm9y
Zz47IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT47IFN0ZXBoZW4gQm95ZA0KPjxzd2Jv
eWRAY2hyb21pdW0ub3JnPjsgVmlub2QgUG9saW1lcmEgKFFVSUMpDQo+PHF1aWNfdnBvbGltZXJA
cXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPjxxdWljX2FiaGluYXZrQHF1aWNp
bmMuY29tPg0KPlN1YmplY3Q6IFJlOiBbdjVdIGRybS9tc20vZGlzcC9kcHUxOiBhZGQgc3VwcG9y
dCBmb3IgZHNwcCBzdWIgYmxvY2sgZmx1c2ggaW4NCj5zYzcyODANCj4NCj5XQVJOSU5HOiBUaGlz
IGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2Fy
eSBvZg0KPmFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9z
Lg0KPg0KPk9uIDI5IFNlcHRlbWJlciAyMDIyIDE5OjEzOjIwIEdNVCswMzowMCwgRG91ZyBBbmRl
cnNvbg0KPjxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOg0KPj5IaSwNCj4+DQo+Pk9uIFdl
ZCwgU2VwIDE0LCAyMDIyIGF0IDU6MTYgQU0gS2FseWFuIFRob3RhIDxxdWljX2thbHlhbnRAcXVp
Y2luYy5jb20+DQo+d3JvdGU6DQo+Pj4NCj4+PiBGbHVzaCBtZWNoYW5pc20gZm9yIERTUFAgYmxv
Y2tzIGhhcyBjaGFuZ2VkIGluIHNjNzI4MCBmYW1pbHksIGl0DQo+Pj4gYWxsb3dzIGluZGl2aWR1
YWwgc3ViIGJsb2NrcyB0byBiZSBmbHVzaGVkIGluIGNvb3JkaW5hdGlvbiB3aXRoDQo+Pj4gbWFz
dGVyIGZsdXNoIGNvbnRyb2wuDQo+Pj4NCj4+PiBSZXByZXNlbnRhdGlvbjogbWFzdGVyX2ZsdXNo
ICYmIChQQ0NfZmx1c2ggfCBJR0NfZmx1c2ggLi4gZXRjICkNCj4+Pg0KPj4+IFRoaXMgY2hhbmdl
IGFkZHMgbmVjZXNzYXJ5IHN1cHBvcnQgZm9yIHRoZSBhYm92ZSBkZXNpZ24uDQo+Pj4NCj4+PiBD
aGFuZ2VzIGluIHYxOg0KPj4+IC0gRmV3IG5pdHMgKERvdWcsIERtaXRyeSkNCj4+PiAtIFJlc3Ry
aWN0IHN1Yi1ibG9jayBmbHVzaCBwcm9ncmFtbWluZyB0byBkcHVfaHdfY3RsIGZpbGUgKERtaXRy
eSkNCj4+Pg0KPj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4gLSBNb3ZlIHRoZSBhZGRyZXNzIG9mZnNl
dCB0byBmbHVzaCBtYWNybyAoRG1pdHJ5KQ0KPj4+IC0gU2VwZXJhdGUgb3BzIGZvciB0aGUgc3Vi
IGJsb2NrIGZsdXNoIChEbWl0cnkpDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHYzOg0KPj4+IC0gUmV1
c2UgdGhlIERQVV9EU1BQX3h4IGVudW0gaW5zdGVhZCBvZiBhIG5ldyBvbmUgKERtaXRyeSkNCj4+
Pg0KPj4+IENoYW5nZXMgaW4gdjQ6DQo+Pj4gLSBVc2Ugc2hvcnRlciB2ZXJzaW9uIGZvciB1bnNp
Z25lZCBpbnQgKFN0ZXBoZW4pDQo+Pj4NCj4+PiBSZXZpZXdlZC1ieTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPj4+IC0tLQ0KPj4+ICBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jICAgICAgIHwgIDIgKy0NCj4+PiAgZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYyB8ICA1ICsrKy0NCj4+PiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5oIHwgIDQgKysrDQo+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jdGwuYyAgICAgfCAzNQ0K
PisrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9od19jdGwuaCAgICAgfCAxMCArKysrKystLQ0KPj4+ICA1IGZpbGVzIGNoYW5n
ZWQsIDUwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj5CcmVhZGNydW1iczog
dGhvdWdoIHRoaXMgaXMgdGFnZ2VkIGluIHRoZSBzdWJqZWN0IGFzIHY1IEkgdGhpbmsgdGhlDQo+
Pm5ld2VzdCB2ZXJzaW9uIGlzIGFjdHVhbGx5ICJyZXNlbmQgdjQiIFsxXSB3aGljaCBqdXN0IGZp
eGVzIHRoZQ0KPj5TaWduZWQtb2ZmLWJ5Lg0KPg0KPk5vdCB0byBtZW50aW9uIHRoYXQgdjUgbWlz
c2VzIHRoZSBTLW8tQiB0YWcuDQo+DQo+Pg0KPj5bMV0NCj4+aHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8xNjYzODI1NDYzLTY3MTUtMS1naXQtc2VuZC1lbWFpbC1xdWljX2thbHlhbnQNCj4+QHF1
aWNpbmMuY29tDQo+DQpMYXRlc3Qgb25lIGlzIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMTY2
MzgyNTQ2My02NzE1LTEtZ2l0LXNlbmQtZW1haWwtcXVpY19rYWx5YW50QHF1aWNpbmMuY29tIHRo
YXQgSSBsYXN0IHBvc3RlZC4NCkRvbuKAmXQgcmVjb2xsZWN0IG9uIHdoeSB0YWcgd2FzIG1hcmtl
ZCBhcyB2NS4gVG8gYXZvaWQgY29uZnVzaW9uLCBzaGFsbCBJIHJlc2VuZCBpdCBhZ2FpbiA/DQo+
LS0NCj5XaXRoIGJlc3Qgd2lzaGVzDQo+RG1pdHJ5DQo=
