Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE186B9010
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8152D10E75E;
	Tue, 14 Mar 2023 10:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9635A10E0CE;
 Tue, 14 Mar 2023 10:32:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EASKUL011058; Tue, 14 Mar 2023 10:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=TPjVMa8Sdly776bdESCy60jZJUxyunhAdfGxtZU7ISc=;
 b=Ir5QRA5FQ+xtRzMXCsnxGPXNoqYiC67YfNqID+b+CVRvVo+ET1fNcP3boJKUaDKH62ny
 +7SZgUg32fqWJIlFa7iVmRfmJnySqbn4P2UmpoM5wtADi2qBXs2jIyWsEKs8wmkGbtVX
 gAiA02KclnSyHVEt4r11kr044mwlH4sKrxrs/41C/OyCNZz8wJ2FiTNl2lPID71NMppf
 fV/Kcwa3tMjgYAZeRCrscG4K51FJ97nW48wB0VCDlYhXjR9IKpVLBFo9a8HjEyypdlv9
 4xx6oirUKuc/wLvSf5qlFmtcpYycj2fbVFry6zmC/1vAr7hfLLTVL05KafiyDdG/Wg0O hg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa203ufe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 10:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdYkJAfw0FWSPLP/yA4RSJsV9JVmhhFkEPuVN/z9dk1XVhOprtC/hf2r76BI4wgwulxIxdu7Hnq+XNlYP7oJaTK6x9w6xu5VJdmh9tZPbvKCL/v5sWJ2L80UDKrxhMtntoiS7MnEkNMMbQPzPilUNY65TpnNztHZyMXKQ78YsOIzHiVifgQHrNKj/IABeEruPmDId1sALky22TzcM2CRKo5UYU3o0tbBcxpB3E78MKyi0XWz+b5tXKkzyTi2IAuQNZNWPadIEDmdTnqS7BlhZyQ1f6oZJS4aKpC4GzaUxY54CCeANnYY4CXnBkrfyKxKI4woLvk2zUcbcsAKSnZKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPjVMa8Sdly776bdESCy60jZJUxyunhAdfGxtZU7ISc=;
 b=kCl93Ar+ZA1dL/e7G/AdWr01dHWnUhJtn8ESFFSAV4Sh4DB3ogjGYjEtzds9Nwd5pu5H5yFqbE2AFw7jpU/Lf7TV/9rUdI76gZjBxgDv7B0YnNK7/zO2pY3rqYJTKuzYYoqt9eEh3pOH+zUct9a/18pzx950UJvokxlGEo2wSeqkiMqQqEub29LULY4ePi/n60d2H9E7Xjshn8nA0onYJuP2ZF/E+lhTeM1Q+ZMlcibTiAS8XjtMXKRbuXpyAPa32DBartfq01SSJvgViDlmrjXF9HpOVfKzLxm0zTkHbMfyUvoQ47qRvmoYyd9O3eGpQfy/jUY0LCI3G6vRlpX9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by CH3PR02MB9478.namprd02.prod.outlook.com (2603:10b6:610:122::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 10:32:15 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::b5e6:371c:98fc:7915]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::b5e6:371c:98fc:7915%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:32:15 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v14 13/14] drm/msm/disp/dpu: update dpu_enc crtc state on
 crtc enable/disable during self refresh
Thread-Topic: [PATCH v14 13/14] drm/msm/disp/dpu: update dpu_enc crtc state on
 crtc enable/disable during self refresh
Thread-Index: AQHZTSTpI88N9UdGvU2ET0AKvZsa7a76JW0g
Date: Tue, 14 Mar 2023 10:32:14 +0000
Message-ID: <BN0PR02MB817342CCDDC0442AD533765BE4BE9@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-14-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1677774797-31063-14-git-send-email-quic_vpolimer@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|CH3PR02MB9478:EE_
x-ms-office365-filtering-correlation-id: 47ff23c4-df55-4bdc-d611-08db247760e8
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y39xcy4V6cbS6um5Rbl07aCstCB5fNLytLmlJsE3iflSez/aJmZU04xHml/5Mlf9tN4a6quorGE37iPC/jjLPD/m22VPS2xeJZr99ME7jlzzU70G0R97wm3wNl5nObnt08zAE4x+Co0xzXYDqOia9Sr52yAZniTB7aL7mHRJM19MnAiqqeYWssbx7nH9vJedSMUVlaT+Oj23Kp3NQPjJCFBmEOSH5Kg1UK4elnKU9N1CsW0cXt3Y8HkbOY5fJqLeObCig4dKzyWL9uwDgBCuSeIREW9TpD8Wo1+2E6uLCoZtpDWdSBnvTfDx+i9+f18ZxF7nqzJR1NPotsZQtbXtQ9TDiNxpEiBYBLV91DOY/6XIhKa3F28HWFEH7reHWOQW10hg0FPKaelr+/JyjTWg7CsJrPtqX/EzPmQGhxdN7DT17Aen9vva/f1ewCl6I/pL0Sgnu6TaX101gL8LXhN6NQR7t8V+CF5iJkW9UNN0RxgCQjzOWRKiUKIFT6mvylqG8V9TOPiRplwq89qYae5D+IcfIUYQOC84bQWPyEzODsgcyfjmKF24n4BnPgdR75iXrkva/E9qMLhcpWRnkMa/VkSBKEL10TtgUzJ55hU0I2DQJY5FcJ9dOBYvylW3HdqX0divR19Ry1bQwNw9rXmo65e/tkn8+FV9NXVqjb7s0vk9EcqQqwewn1AOp78s2fCs+2Fl9v1KOt+2qVRM7bwjug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199018)(52536014)(5660300002)(8936002)(15650500001)(2906002)(41300700001)(38100700002)(122000001)(38070700005)(86362001)(33656002)(7696005)(71200400001)(478600001)(76116006)(66946007)(66556008)(66476007)(66446008)(8676002)(64756008)(107886003)(55016003)(4326008)(83380400001)(110136005)(54906003)(316002)(9686003)(186003)(26005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H5uBjdcyKswxFJGt0LMgc96/oWpmMXhEwAZFkrKXG5oMqFi9nUwXbTn8Z8+z?=
 =?us-ascii?Q?WVwHnX7p3yXUKuosjMwwvjAUpTF5CdnH7WKyz0OZnnLvxRBTu2qHHmM8CHTo?=
 =?us-ascii?Q?GrOxTisWbVzhS9hAkBj/PFZoX4rMubvtgVvv5qF4BBDy5/uU7x1LnwaCuRJX?=
 =?us-ascii?Q?PGEp5B4+Y1D9PAxXJXhFYZuQeqwsTm/reNSwlYVLHSO2gaU978WKxy3pNtul?=
 =?us-ascii?Q?MSw6xR4OGAC5vZtWeaMpYirrAg5psxlwkUafxfcevXHtE+U9TVk0Op/8gdn6?=
 =?us-ascii?Q?YxnfIiBYMxhv05wZyu73Rj1cKX6r0o6vcGBaj5nSjtsC1inEjtGCeDaE5g7Z?=
 =?us-ascii?Q?e5Y2MXXIjs/DyvLS3rSl3Bp7e1VCVjdJpONmGgbMY1NPwi8ncrefX6xLF7bC?=
 =?us-ascii?Q?hbKSyGaWTocK4OdoL3R2gxGj40q18V2KTba0ae4AVsw02dqtyUX4JkYL1Yl4?=
 =?us-ascii?Q?0s3HzeboVirjY/SuvCzEhiWDU5yWeU0ycLZj0s0rWQ8X8Bey9gFga8fXDmQS?=
 =?us-ascii?Q?5PB22Oy/mWFRS7t1Lb+bmHyHSL6RKyJShpSbFzHl0xjviOT/64FrhBPoutwv?=
 =?us-ascii?Q?ty0KvOA9tC/EC9AfVHpjDh6pIoW8rNihd+tqTVMCOBvGNgVm6lg/zRTn/3z/?=
 =?us-ascii?Q?NdQH1Cy4I03OQTa5lcSOw2QfIcJ1aCAIru4jCQTCl7q1UcNCacJac/jSS18t?=
 =?us-ascii?Q?4LcAxgYjhlzW1Po8d3yhFMluMtN+V/CP5NiOqr2eD9oELI5G+ooVYrZfgN+8?=
 =?us-ascii?Q?4bMsXQ9jic9nnnEOhO1fQ9l51dpw2vj09nBnlWdMxsyZeSJPP1eskZpYE7Nu?=
 =?us-ascii?Q?LU3jkmxUucKT46zrvMayAwzxkEXcW5Waqveapdqp7s5v7FtTO6O5ANX64ZHY?=
 =?us-ascii?Q?PYkuNeik6LXiNHV9YKMiQTtzAfAKplP7/3A6ijDxMzTREtXGGPEv0SKBcoWP?=
 =?us-ascii?Q?iV4rFMExa/cF58AIQZDEcc1LLcmGMFSB0glDNBzhMqpb3iJQeV0rvTsO3fCR?=
 =?us-ascii?Q?V3VK7cE4RsMkrywcJs/cCMym6DlwTh82xcEa5JlJkEA5jAI0EXMfBZWRJcyt?=
 =?us-ascii?Q?rI9faR6zzEPF1uzVsulQauNcjBkQD0cLKJPu+y7ElGlT42cMkiBeqUIzrlWS?=
 =?us-ascii?Q?0zxegnkNQBNh9B5xilVUW4BJdIMDYPn1PGShBSwlVHMKwWw1xOshMufsNdS2?=
 =?us-ascii?Q?YdiZYCA1CSWroguspOSI11TknibVls83CQVvnZH2t3TLOlxfSom5i7yCsfB/?=
 =?us-ascii?Q?ALssmc/Rw+rvCIwTzsd3FVGbibmuc2Osk2FZNqk20lshdzUUVahxdz6mF3tS?=
 =?us-ascii?Q?eOvN/GGdvhZhX1Gy6ghmpn6k0uixTvlcpisZLNKohKXJDd80M4ySPfNhFM1H?=
 =?us-ascii?Q?tQGZh5NytScYBCQdRvx39UiIe/CE0m3XFWBHHN0vCbazA92hb0+9DDn6bBZP?=
 =?us-ascii?Q?BGl5hbwaGdClCgzLntoI7+4XY23Ox2+UPUwn2DcsdSsgHJE6btuFoR0zLbG5?=
 =?us-ascii?Q?M9k8kF4op/l0LXTeHetS0OSnNHlGiELOs2B8lCiidWa9kdpTui4P5NLAdfEv?=
 =?us-ascii?Q?zZETqC572SmsTIgV4sKiBbStq1+r1MKOCbop/Istryo570Kz8stgcN9GHXcf?=
 =?us-ascii?Q?iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?lMV+XP6M+8U87cXjBSMpkqfdwMvNLBXZGk9yGNsRY0iOhCLY5YBB1qiXsX9d?=
 =?us-ascii?Q?d4r3j+dTy+I01/gKRm2sKijOfOG6nCPnI/5MHBf7lGaw4P1AUrxReXC/5onz?=
 =?us-ascii?Q?/3bOgFu+IWDyjhoKCWbpQoxDmZeAuSw7JrUFugQ8IL+y/VvcTyjU9CtB3/Br?=
 =?us-ascii?Q?cTQ8TEsGnFaxj4fzdy0ZabwptGSLuo+2E0ctqrDUX+U/KA5xyJcYF/L7WVoU?=
 =?us-ascii?Q?viv8pQgQsQIUyMclRs3fuLyRy2uS6gQKT57wVn+qP2sgnSHtLDJHHwGgeQjR?=
 =?us-ascii?Q?JRfP6NbOl3cxjhuVPoaLhyuiP1KlwBb/2KNEmPScwbRlSqQ8Niw94NCVVddj?=
 =?us-ascii?Q?HWtFAqIanaAPxPRJgKFiG5jQdvKlMnzH7RXSDKOLlVfW92u7TpSoOvqWwqb2?=
 =?us-ascii?Q?I3zxCbr7MpFwjfvm18blTBAvN0h2YdB7UsHQiJJlinah33NzTQui2pvRGmrl?=
 =?us-ascii?Q?bMLPC2wYuwA73bBxuyC33OPoJQAJM3J02P7UM4RduFTPvSVBXkZ7c1ZqMJ6X?=
 =?us-ascii?Q?zVmGHJzM9PibNGPFj4toPvGXrSvwuYu1GUpXPIcoD+rtCRssbHn8dOeSF1l3?=
 =?us-ascii?Q?083qVOHTSUNh3OQj7y68MuqW6AI2KHeEyZKikeuJA14YLo5sgIj+aS8XLuEe?=
 =?us-ascii?Q?edxhSG6JstShrGFdRqJeybuWJcOhMIO2rzirjIQr5i8WIALCKex0gZ5YUvmx?=
 =?us-ascii?Q?J+ddFtldUf0B+kI95b/lJv8fi3e/saWe7LQirQiXd7zGLFSxloG3cLJYMdpf?=
 =?us-ascii?Q?4wF4btWT90wMggjmq06ZHJIWvjT+lAmuw9fIYhMJKFlm9AF9JEN+kCDE/HYN?=
 =?us-ascii?Q?/JDOW93n0YV6fMFNyZK84iN7MUqonJKocU457ko+oZ8DA00DEFFKDgaulSBU?=
 =?us-ascii?Q?YZIHv9o6MbD3Vug5iZHe4Y7N22QLFhANLckA8Ci/XNIhIv+7oJR8XlivKedS?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ff23c4-df55-4bdc-d611-08db247760e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 10:32:14.8168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4h7u4jQiSxKBfc6Cp5k7LmYBCEfRSbdhh4EJ+JYzZEMzapW9SL7WLbbRZa/YlnTcb5zGmUmtepL4Kdun3+ZM+TatW6QoukHZqkiq3AyNyU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9478
X-Proofpoint-ORIG-GUID: cWfkInFFB9M58ECqsdA3J5Iwp4YV5oVC
X-Proofpoint-GUID: cWfkInFFB9M58ECqsdA3J5Iwp4YV5oVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140090
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
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>
> Sent: Thursday, March 2, 2023 10:03 PM
> To: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
> Cc: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; linux-
> kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
> swboyd@chromium.org; Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>;
> dmitry.baryshkov@linaro.org; Kuogee Hsieh (QUIC)
> <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
> <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
> <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
> <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
> <quic_sbillaka@quicinc.com>
> Subject: [PATCH v14 13/14] drm/msm/disp/dpu: update dpu_enc crtc state
> on crtc enable/disable during self refresh
>=20
> Populate the enocder software structure to reflect the updated
> crtc appropriately during crtc enable/disable for a new commit
> while taking care of the self refresh transitions when crtc
> disable is triggered from the drm self refresh library.
>=20
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Adding the RB tag which was reviewed by Dmitry on V13.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 29
> +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 60e5984..b1ec0c3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1022,8 +1022,17 @@ static void dpu_crtc_disable(struct drm_crtc *crtc=
,
>=20
>  	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>=20
> -	if (old_crtc_state->self_refresh_active)
> +	/* If disable is triggered while in self refresh mode,
> +	 * reset the encoder software state so that in enable
> +	 * it won't trigger a warn while assigning crtc.
> +	 */
> +	if (old_crtc_state->self_refresh_active) {
> +		drm_for_each_encoder_mask(encoder, crtc->dev,
> +					old_crtc_state->encoder_mask) {
> +			dpu_encoder_assign_crtc(encoder, NULL);
> +		}
>  		return;
> +	}
>=20
>  	/* Disable/save vblank irq handling */
>  	drm_crtc_vblank_off(crtc);
> @@ -1036,7 +1045,14 @@ static void dpu_crtc_disable(struct drm_crtc *crtc=
,
>  		 */
>  		if (dpu_encoder_get_intf_mode(encoder) =3D=3D
> INTF_MODE_VIDEO)
>  			release_bandwidth =3D true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
> +
> +		/*
> +		 * If disable is triggered during psr active(e.g: screen dim in
> PSR),
> +		 * we will need encoder->crtc connection to process the
> device sleep &
> +		 * preserve it during psr sequence.
> +		 */
> +		if (!crtc->state->self_refresh_active)
> +			dpu_encoder_assign_crtc(encoder, NULL);
>  	}
>=20
>  	/* wait for frame_event_done completion */
> @@ -1084,6 +1100,9 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>  	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
>  	struct drm_encoder *encoder;
>  	bool request_bandwidth =3D false;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(state, crtc);
>=20
>  	pm_runtime_get_sync(crtc->dev->dev);
>=20
> @@ -1106,8 +1125,10 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>  	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>  	dpu_crtc->enabled =3D true;
>=20
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state-
> >encoder_mask)
> -		dpu_encoder_assign_crtc(encoder, crtc);
> +	if (!old_crtc_state->self_refresh_active) {
> +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc-
> >state->encoder_mask)
> +			dpu_encoder_assign_crtc(encoder, crtc);
> +	}
>=20
>  	/* Enable/restore vblank irq handling */
>  	drm_crtc_vblank_on(crtc);
> --
> 2.7.4

