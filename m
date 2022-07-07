Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBA56A638
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 16:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C1310EC94;
	Thu,  7 Jul 2022 14:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 940 seconds by postgrey-1.36 at gabe;
 Thu, 07 Jul 2022 14:55:05 UTC
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5FB112BC1;
 Thu,  7 Jul 2022 14:55:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267CuNRI015491;
 Thu, 7 Jul 2022 14:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qti.qualcomm.com;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=dbYig8RAGX519p1RC58WvW7hBpZAFWnIobnd5JoGBU4=;
 b=g+20fxxgDMR1aj0pq/+mFDohl3XeGPbhrGLubcUPVxjE+LRkgumqKieFlFRFz+ExmY6a
 ETI163Dy3csHZKBhHky2IyUJbtT9RubqLbUmGHGYdi/mmGKXlGVScdALWGjvzSObXwi2
 az/GJeymybGMmhWA+0Hb8tHQbMz3PSMSqAtrP93WhB4R+j9OxSkp0/tWW7Ie12cCITVQ
 cylHcPihkf3ekq79wVY49NfZqbFh2KV8/mChP/pmZmgCiH6VcIuKSNzrLRbHE/3p7sJ/
 6fzK92Wul/5bpuUfmdIWbcErIlcc3t6xlBrRkmAGGJ6ip4ZOFHqITlKU36cC8FcX7un3 kQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h5tjmrshr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 14:39:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhpeWZNv60l+/ESZSxalvwoqasDf2Eeup26h6b5oIXZkp2v6SlD00hx2KHHhkjESXNqGuEAg6UP/bh+ivhz48O6PsI+VR4nwMQgAtMMBdEXJATPHBmTQ1HkxZpYtvAXm/aAHYiA2G9lWg4lL8Pbg82eEyuNCJ2EgFArG4WaDkh7poqEi3YgL2iQdjg55cJpwKfAThxiHp4x6KbvdZo9WyFjS8gwmdJRqVJpGR+RQ8MIkfDw4o7fQ0ICyq2eUcrP777LeJduVZRlxJcw5p3NaD1WyXiyyUpyGupvyKjtHStaZiII1WSZCiQeh0vYQcFFq3umYAmvkwP5RKz1zJT6URg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbYig8RAGX519p1RC58WvW7hBpZAFWnIobnd5JoGBU4=;
 b=RXRcIadmQfkzUV9F4MbS1lGxX9FJhrflHYqKlX8I3SRSU576iozfO4AV0JPIaO1ZFiiV1g0BCuZgZuCVQfDFVrpjingifKCqMCRETBaWo4AMnUWQ4vwr4RriSbxOx9UsZBQx5aKQ5spgBoWsjsTPs8JTShCjM51GK4XYgvZCLPNtKsNcVGEr3g0k8N1wpBYBRIdwca+lIhZngJYltYjlwEKv6Vcr3l2R7QPX7s7eESEZ6jGRR70PFD0ru6wBNNVeV0Rt5CKN+Is9c/lB73NhxoXbf7moFI4mTE407s7UxFuNxkb1LVptxOKIUh6gjja2mgrVAyRxtNSlCuY8dVUtkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by BL0PR02MB4404.namprd02.prod.outlook.com (2603:10b6:208:45::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 14:39:19 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7%4]) with mapi id 15.20.5395.022; Thu, 7 Jul 2022
 14:39:18 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] drm/msm/disp/dpu1: clear dpu_assign_crtc and get
 crtc from drm_enc instead of dpu_enc
Thread-Topic: [PATCH v4 1/7] drm/msm/disp/dpu1: clear dpu_assign_crtc and get
 crtc from drm_enc instead of dpu_enc
Thread-Index: AQHYkJDj4/gJo7Pgc0yQIAq2Z/OEB61wItMAgALQtMA=
Date: Thu, 7 Jul 2022 14:39:18 +0000
Message-ID: <BN0PR02MB8173DF17816659868604A82EE4839@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-2-git-send-email-quic_vpolimer@quicinc.com>
 <5d469759-0619-eece-902d-df8ac6583f22@linaro.org>
In-Reply-To: <5d469759-0619-eece-902d-df8ac6583f22@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dcdbf8c-c219-4e87-8e07-08da60267958
x-ms-traffictypediagnostic: BL0PR02MB4404:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SamQ8G9na08xWmHoo4NeQ31xJPgdKhLJNviYfJQ/Yy/Yr25MiU+vgMud3jZ/KyrMrsZyIWptcZ8xYb4szl2wuwf9lYaH1+AzUmgDOT6MsIuvuU8s9PnHRK/91DcL0JmCBSWpzf1K8wX9IGmgHg7oj1OIqE0Z4PGmudpKGUWi+rPXF6bb6g9f4tV1toAmLaByC6DfoLAaQrxfGrp1rdqXjfljYK7OTTuRwZcvrYvSSGB1x17COKio5DVuhMNooAiN3TxAsPGnLoWlnS+QdOZUx/yiLnDS9e8nAU/HfBzkMuTlg4lEwtznR4HD7NSKRDOTtCZaDYvsfbiB71+D5TJQ2AEdy924GZd8qryWVXo8fnNXYn7vZfh+v3+onTbpUos9KApVzWIAF6F8WOmE5WIg5pEHsUqvBuZqzIf8mMmYNM7CZwNBhKMwuR0VZmrevx/trGxeGG0TFXP7J1J4/GxYeymL5ci8WSJtsoh9l/aET+L6RXmrx7DkCsJ5XkghFeCnhMu7LVDbnRHvMvFhwC60422RQSvUDSmr7Ik2a5T10zCOLlcsPIU7P/TJhEcOx+DQ0vl7pmowxTnhmcLZfBAH6FBu4ta+LbcjrVAh+JxzKCgaSaXBRxJgLMfYZlxdJfM8j7kDptCjcGr423Lf+PeIuEgL62Y9qEmsi25+p1AwRsUMA/ppqOIcoOUfjymjxe9YoC/xwjf2oFaorTuHBkx4p5rHVJMRP57CGMV3fng1JsZmBHOLiJesjwZ2G9CQWI8rUyElcD6sr1DidhgogLQzoMTiRMOjsuNNvaOgflj93KAIeAfMsmyfOh7SlGI6ajf/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(53546011)(2906002)(66446008)(66476007)(66556008)(38070700005)(41300700001)(33656002)(4326008)(8676002)(6506007)(64756008)(66946007)(7696005)(86362001)(478600001)(8936002)(316002)(52536014)(76116006)(7416002)(71200400001)(5660300002)(83380400001)(186003)(55016003)(107886003)(9686003)(54906003)(110136005)(38100700002)(26005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGVoeGlYZk8zNWhUWWhieEd6d09STC85TFZIMGRXSFdDdC96UXBkbmFqYXRQ?=
 =?utf-8?B?M05aZHJsN2NxUkV0UzUrRG96SVZJdGZVeWFZdHdYNzF0c1VGSEdlenVla2dT?=
 =?utf-8?B?b0FuSm0vWElXLzNyZFpPUkxlMnk2T2RZZU5aWnc4WWpyZmtibTVDQjBJMDZm?=
 =?utf-8?B?WWlweXR2M043NHQxOCs1aE1YMmZ0TlhLZklWNFFpcGdXaDkxWlBDa3g5N2d2?=
 =?utf-8?B?b3VJUE45VzJoRURvdS9aNE5KdGZoWGhRUHVCVElYQUlCU010L1RGc0dzcUw2?=
 =?utf-8?B?REZvcHZlZkZHTzF4cExQYnFzQndKb3NTcXNlWlVTT2tpME9ONVRrRUFSeXlz?=
 =?utf-8?B?c1l1eXd2WnRjYWNKWVNmMVk4aHcwT0ZCZHdtOWNmd04zVE5yaUU3WFpmcVlZ?=
 =?utf-8?B?WkFaeHRDQmZEL2I0S1hPd1RSZ05jUjh1ZU03eC9QOGtXcHdkZGk0N3dYcVJn?=
 =?utf-8?B?c3YxcC82NW9LdHhld0R0cTVDL1JvVVBnUGJBYzVKdEwwQmMyZlhzSFZRL0NP?=
 =?utf-8?B?UXFhQmM0SjdDOVNwUndoOXB5V09KMXcwR1lMQ0VxK1A4bE0zNThwQ3NtcW1X?=
 =?utf-8?B?b2I4bXBOajV1MGdQcHg0ZTZxeGxlc3RrZHVjaDc5L2xaUVg5T3dKMnlIQWtO?=
 =?utf-8?B?TG9TdjF0QnM1T1Q2aUtJcHNVV0ozRmh3elRXSWNYS2p0OUllenpDQ3k3Y0FF?=
 =?utf-8?B?RXU3Mk5vcEhabENSWHZ1MXRrLzU4Sll0SmZKZjMyRU1lM3RnN0pxQnFGL05H?=
 =?utf-8?B?NVdNMldTSXUxM2ZJNi9UQ2lQZUo4Q1FkRUdDRjc1UmRWaUhBMVNGTDdDWGR5?=
 =?utf-8?B?azltbVNxeDY1WjdmQzdLMU85MmZJRUtMa2FSMVE3azNrL29vTTZYRDZwYkI0?=
 =?utf-8?B?dndXUzRhM2QvdmV3ZkJaNHV4M1JZSnJrR0UzczVjSkZWOWtIY3ZyeUZhL2RQ?=
 =?utf-8?B?NElIdUhyV0UveEt3dlZxdVNseTJzYWoxTDA1dGt4MGJQMlVCTExDaFUwb1lY?=
 =?utf-8?B?T3dtYVdGQ2hyWE9RNmZ6Rmx5a3lLQmczcjh6TEg4YW9pT201T1BoU0dsUGRi?=
 =?utf-8?B?VGtEZ1NYMDRqdzZWWWdEZnhqenJOSlFzVmNOUDdYait2NFYyeEs3blRiekVm?=
 =?utf-8?B?T0hOOE4zNGNtYnFvbmM4WFVIMVN4YU9oYmEwK0NqaGdieGI3Q2w1czJZaGxQ?=
 =?utf-8?B?aGRicC9mUHBOQWdoaEhFZW5YckFZWDFqbHJlK1lpTVBvZVYvSGZjZFQrVzRQ?=
 =?utf-8?B?bGZwcmdsaWgwS0NkMzdWMVpKbXJ2ekRCVnNQM1BQZXZuTFo4dUkrOE8rNFp0?=
 =?utf-8?B?TllLOVdhTUo2cEliNzZGMmhsVGhpRjFITXhTdXZBTDZXT2o0V1RkYS9SVjY5?=
 =?utf-8?B?ZDlqd2VsZFJHb2FwdkJZbkUwdnJiZG1xQnV6TFp0VUxPN1BrcktZa0lscVc3?=
 =?utf-8?B?YlN4eTZqQXhNelVxZ1VCTkhrd3FJTDd4Z1lwWmJTTDZ4SW1naTFKS1BjN09M?=
 =?utf-8?B?WmkyS1BTL05WUTBlU1A2ZDlNNmNNWUhPaDJaSmN3WVFNb1BlbHBVa0pCWGY4?=
 =?utf-8?B?RXAyTnRiWnRRMWIvOHM0QW53aGN0dWR5eWpYV0FNZzJQWTI4cGZRWEJ1R1lS?=
 =?utf-8?B?c3VFT1dTM1pibi9xZkxnbU5FalNkVldqY0hUclhKNEZCOFluYmxYMUZLUjMz?=
 =?utf-8?B?MDUzK005emNTMVZieGpjUVdjb1krcm93a3NLYzJEZ2haSy9zNVI0MUMvSG9p?=
 =?utf-8?B?SEtwV2s4Ujh3ZERYSTJ3MkZJWlJ6NmN5eC90blpSZHg5YVlCZUZ3bCtmUE1k?=
 =?utf-8?B?eU51OG03SFBMTHU0SjZ4N3hRMitUSHV6ZTZ0bTBDL2E1SnlMRjNuT0E4NENO?=
 =?utf-8?B?cEVaT3RwZHdWdHlZaTBHMW15TU5BcjU3MjN2cDJuRlp4eDllNnRjM3lkeEtx?=
 =?utf-8?B?RktOWm5EYUltQ1RDSWFpWEJ3dnZPbzkrLy9XbndUUGRVOURDOXJxYkM1SGxO?=
 =?utf-8?B?VEZUdCtRYUkvcjFQbDgvenhLaXRMaGNBK0c0UEloWU51Z296ZjZRemVmZVQy?=
 =?utf-8?B?RHRRN2IrdW1uY29kNVlldXBhRW1lMHFTOVA1S05JMmc4Qjhia0JzMFVHbFB4?=
 =?utf-8?B?azQvVVVIZ0owUndoQWFMaUp0Z01aUW4rRVZRb2xlL3VPc0N0MWpPN0dKZjFG?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcdbf8c-c219-4e87-8e07-08da60267958
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 14:39:18.6592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKV4eevruxk7eBnsE2Ysi8heARLFca6xCbv8iCpUj7S+cRjYrjMS+f2s+7m0o6kWFQOqDjVDjT6MkQS1p0zb7I0pq3uUWtJ2utySPAJeeeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4404
X-Proofpoint-ORIG-GUID: 9bAGr51EvbcED8S6OFkYBYZAUN90iVtW
X-Proofpoint-GUID: 9bAGr51EvbcED8S6OFkYBYZAUN90iVtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=950 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070057
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
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBOQUsuIFF1b3RpbmcgdGhlIGRvY3VtZW50YXRpb246DQo+IA0KPiBvbmx5IHJlYWxseSBtZWFu
aW5nZnVsIGZvciBub24tYXRvbWljIGRyaXZlcnMuIEF0b21pYyBkcml2ZXJzIHNob3VsZA0KPiBp
bnN0ZWFkIGNoZWNrICZkcm1fY29ubmVjdG9yX3N0YXRlLmNydGMuDQo+IA0KPiBQbGVhc2UgYWRq
dXN0IGFjY29yZGluZyB0byB0aGUgZG9jdW1lbnRhdGlvbi4NCiAgIGRybV9lbmMgZ2V0cyB0aGUg
Y3J0YyBpbmZvIGFscmVhZHkgZnJvbSBuZXcgY29ubmVjdG9yIHN0YXRlIGFzIHBhcnQgb2YgZHJt
X2F0b21pY19oZWxwZXJfdXBkYXRlX2xlZ2FjeV9tb2Rlc2V0X3N0YXRlLiANCiAgIFNvIGRybV9l
bmMtPmNydGMgd2lsbCBiZSB2YWxpZCBhcyB3ZSBhY2Nlc3MgaXQgYXMgcGFydCBvZiBtb2Rlc2V0
IGVuYWJsZS9kaXNhYmxlLg0KICAgICAgICAgICAgICAgICAgICAgICAgIGBgYGNvbm5lY3Rvci0+
ZW5jb2Rlci0+Y3J0YyA9IG5ld19jb25uX3N0YXRlLT5jcnRjO2BgYC4NCg0KVGhhbmtzLA0KVmlu
b2QgUC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgQmFy
eXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
SnVseSA2LCAyMDIyIDEyOjM0IEFNDQo+IFRvOiBWaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNf
dnBvbGltZXJAcXVpY2luYy5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVyc0BjaHJv
bWl1bS5vcmc7IHN3Ym95ZEBjaHJvbWl1bS5vcmc7IEthbHlhbiBUaG90YSAoUVVJQykNCj4gPHF1
aWNfa2FseWFudEBxdWljaW5jLmNvbT47IEt1b2dlZSBIc2llaCAoUVVJQykNCj4gPHF1aWNfa2hz
aWVoQHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPiA8cXVp
Y192cHJvZGR1dEBxdWljaW5jLmNvbT47IGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnOyBBcmF2
aW5kDQo+IFZlbmthdGVzd2FyYW4gKFFVSUMpIDxxdWljX2FyYXZpbmRoQHF1aWNpbmMuY29tPjsg
QWJoaW5hdiBLdW1hcg0KPiAoUVVJQykgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+OyBTYW5r
ZWVydGggQmlsbGFrYW50aSAoUVVJQykNCj4gPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS83XSBkcm0vbXNtL2Rpc3AvZHB1MTogY2xlYXIgZHB1
X2Fzc2lnbl9jcnRjIGFuZA0KPiBnZXQgY3J0YyBmcm9tIGRybV9lbmMgaW5zdGVhZCBvZiBkcHVf
ZW5jDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9m
IFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMs
IGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IE9uIDA1LzA3LzIwMjIgMjA6MDAsIFZp
bm9kIFBvbGltZXJhIHdyb3RlOg0KPiA+IFVwZGF0ZSBjcnRjIHJldHJpZXZhbCBmcm9tIGRwdV9l
bmMgdG8gZHJtX2VuYywgc2luY2UgbmV3IGxpbmtzIGdldCBzZXQNCj4gPiBhcyBwYXJ0IG9mIHRo
ZSB1cGRhdGUgbGVnYWN5IG1vZGUgc2V0LiBUaGUgZHB1X2VuYy0+Y3J0YyBjYWNoZSBpcyBubw0K
PiA+IG1vcmUgbmVlZGVkLCBoZW5jZSBjbGVhbmluZyBpdCBhcyBwYXJ0IG9mIHRoaXMgY2hhbmdl
Lg0KPiANCj4gTkFLLiBRdW90aW5nIHRoZSBkb2N1bWVudGF0aW9uOg0KPiANCj4gb25seSByZWFs
bHkgbWVhbmluZ2Z1bCBmb3Igbm9uLWF0b21pYyBkcml2ZXJzLiBBdG9taWMgZHJpdmVycyBzaG91
bGQNCj4gaW5zdGVhZCBjaGVjayAmZHJtX2Nvbm5lY3Rvcl9zdGF0ZS5jcnRjLg0KPiANCj4gUGxl
YXNlIGFkanVzdCBhY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRpb24uDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgICAg
fCAgNCAtLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
ci5jIHwgMTggKysrLS0tLS0tLS0tLS0tLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfZW5jb2Rlci5oIHwgIDggLS0tLS0tLS0NCj4gPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYw0KPiA+IGluZGV4IGI1NmY3NzcuLmY5MWUz
ZDEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Ny
dGMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMN
Cj4gPiBAQCAtOTcyLDcgKzk3Miw2IEBAIHN0YXRpYyB2b2lkIGRwdV9jcnRjX2Rpc2FibGUoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLA0KPiA+ICAgICAgICAgICAgICAgICovDQo+ID4gICAgICAgICAg
ICAgICBpZiAoZHB1X2VuY29kZXJfZ2V0X2ludGZfbW9kZShlbmNvZGVyKSA9PSBJTlRGX01PREVf
VklERU8pDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlbGVhc2VfYmFuZHdpZHRoID0gdHJ1
ZTsNCj4gPiAtICAgICAgICAgICAgIGRwdV9lbmNvZGVyX2Fzc2lnbl9jcnRjKGVuY29kZXIsIE5V
TEwpOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgIC8qIHdhaXQgZm9yIGZyYW1lX2V2ZW50
X2RvbmUgY29tcGxldGlvbiAqLw0KPiA+IEBAIC0xMDQyLDkgKzEwNDEsNiBAQCBzdGF0aWMgdm9p
ZCBkcHVfY3J0Y19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiA+ICAgICAgIHRyYWNl
X2RwdV9jcnRjX2VuYWJsZShEUk1JRChjcnRjKSwgdHJ1ZSwgZHB1X2NydGMpOw0KPiA+ICAgICAg
IGRwdV9jcnRjLT5lbmFibGVkID0gdHJ1ZTsNCj4gPg0KPiA+IC0gICAgIGRybV9mb3JfZWFjaF9l
bmNvZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LCBjcnRjLT5zdGF0ZS0NCj4gPmVuY29kZXJf
bWFzaykNCj4gPiAtICAgICAgICAgICAgIGRwdV9lbmNvZGVyX2Fzc2lnbl9jcnRjKGVuY29kZXIs
IGNydGMpOw0KPiA+IC0NCj4gPiAgICAgICAvKiBFbmFibGUvcmVzdG9yZSB2YmxhbmsgaXJxIGhh
bmRsaW5nICovDQo+ID4gICAgICAgZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOw0KPiA+ICAgfQ0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
ci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+
IGluZGV4IDUyNTE2ZWIuLjU2MjljMGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4gPiBAQCAtMTI1NCw4ICsxMjU0LDggQEAgc3Rh
dGljIHZvaWQgZHB1X2VuY29kZXJfdmJsYW5rX2NhbGxiYWNrKHN0cnVjdA0KPiBkcm1fZW5jb2Rl
ciAqZHJtX2VuYywNCj4gPiAgICAgICBkcHVfZW5jID0gdG9fZHB1X2VuY29kZXJfdmlydChkcm1f
ZW5jKTsNCj4gPg0KPiA+ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkcHVfZW5jLT5lbmNfc3Bp
bmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+IC0gICAgIGlmIChkcHVfZW5jLT5jcnRjKQ0KPiA+IC0g
ICAgICAgICAgICAgZHB1X2NydGNfdmJsYW5rX2NhbGxiYWNrKGRwdV9lbmMtPmNydGMpOw0KPiA+
ICsgICAgIGlmIChkcm1fZW5jLT5jcnRjKQ0KPiA+ICsgICAgICAgICAgICAgZHB1X2NydGNfdmJs
YW5rX2NhbGxiYWNrKGRybV9lbmMtPmNydGMpOw0KPiA+ICAgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmRwdV9lbmMtPmVuY19zcGlubG9jaywgbG9ja19mbGFncyk7DQo+ID4NCj4gPiAgICAg
ICBhdG9taWNfaW5jKCZwaHlfZW5jLT52c3luY19jbnQpOw0KPiA+IEBAIC0xMjgwLDE4ICsxMjgw
LDYgQEAgc3RhdGljIHZvaWQNCj4gZHB1X2VuY29kZXJfdW5kZXJydW5fY2FsbGJhY2soc3RydWN0
IGRybV9lbmNvZGVyICpkcm1fZW5jLA0KPiA+ICAgICAgIERQVV9BVFJBQ0VfRU5EKCJlbmNvZGVy
X3VuZGVycnVuX2NhbGxiYWNrIik7DQo+ID4gICB9DQo+ID4NCj4gPiAtdm9pZCBkcHVfZW5jb2Rl
cl9hc3NpZ25fY3J0YyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmRybV9lbmMsIHN0cnVjdA0KPiBkcm1f
Y3J0YyAqY3J0YykNCj4gPiAtew0KPiA+IC0gICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpk
cHVfZW5jID0gdG9fZHB1X2VuY29kZXJfdmlydChkcm1fZW5jKTsNCj4gPiAtICAgICB1bnNpZ25l
ZCBsb25nIGxvY2tfZmxhZ3M7DQo+ID4gLQ0KPiA+IC0gICAgIHNwaW5fbG9ja19pcnFzYXZlKCZk
cHVfZW5jLT5lbmNfc3BpbmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+IC0gICAgIC8qIGNydGMgc2hv
dWxkIGFsd2F5cyBiZSBjbGVhcmVkIGJlZm9yZSByZS1hc3NpZ25pbmcgKi8NCj4gPiAtICAgICBX
QVJOX09OKGNydGMgJiYgZHB1X2VuYy0+Y3J0Yyk7DQo+ID4gLSAgICAgZHB1X2VuYy0+Y3J0YyA9
IGNydGM7DQo+ID4gLSAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHB1X2VuYy0+ZW5jX3Nw
aW5sb2NrLCBsb2NrX2ZsYWdzKTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAgIHZvaWQgZHB1X2VuY29k
ZXJfdG9nZ2xlX3ZibGFua19mb3JfY3J0YyhzdHJ1Y3QgZHJtX2VuY29kZXINCj4gKmRybV9lbmMs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsIGJvb2wgZW5hYmxlKQ0KPiA+ICAgew0KPiA+IEBAIC0xMzAyLDcgKzEyOTAsNyBA
QCB2b2lkIGRwdV9lbmNvZGVyX3RvZ2dsZV92YmxhbmtfZm9yX2NydGMoc3RydWN0DQo+IGRybV9l
bmNvZGVyICpkcm1fZW5jLA0KPiA+ICAgICAgIHRyYWNlX2RwdV9lbmNfdmJsYW5rX2NiKERSTUlE
KGRybV9lbmMpLCBlbmFibGUpOw0KPiA+DQo+ID4gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRw
dV9lbmMtPmVuY19zcGlubG9jaywgbG9ja19mbGFncyk7DQo+ID4gLSAgICAgaWYgKGRwdV9lbmMt
PmNydGMgIT0gY3J0Yykgew0KPiA+ICsgICAgIGlmIChkcm1fZW5jLT5jcnRjICE9IGNydGMpIHsN
Cj4gPiAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRwdV9lbmMtPmVuY19z
cGlubG9jaywgbG9ja19mbGFncyk7DQo+ID4gICAgICAgICAgICAgICByZXR1cm47DQo+ID4gICAg
ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
ZW5jb2Rlci5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIu
aA0KPiA+IGluZGV4IDc4MWQ0MWMuLmVkYmE4MTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmgNCj4gPiBAQCAtMzksMTQgKzM5LDYgQEAg
c3RydWN0IG1zbV9kaXNwbGF5X2luZm8gew0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgLyoqDQo+ID4g
LSAqIGRwdV9lbmNvZGVyX2Fzc2lnbl9jcnRjIC0gTGluayB0aGUgZW5jb2RlciB0byB0aGUgY3J0
YyBpdCdzIGFzc2lnbmVkIHRvDQo+ID4gLSAqIEBlbmNvZGVyOiBlbmNvZGVyIHBvaW50ZXINCj4g
PiAtICogQGNydGM6ICAgIGNydGMgcG9pbnRlcg0KPiA+IC0gKi8NCj4gPiAtdm9pZCBkcHVfZW5j
b2Rlcl9hc3NpZ25fY3J0YyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjKTsNCj4gPiAtDQo+ID4g
LS8qKg0KPiA+ICAgICogZHB1X2VuY29kZXJfdG9nZ2xlX3ZibGFua19mb3JfY3J0YyAtIFRvZ2ds
ZXMgdmJsYW5rIGludGVycnVwdHMgb24gb3INCj4gb2ZmIGlmDQo+ID4gICAgKiAgdGhlIGVuY29k
ZXIgaXMgYXNzaWduZWQgdG8gdGhlIGdpdmVuIGNydGMNCj4gPiAgICAqIEBlbmNvZGVyOiAgICAg
ICAgZW5jb2RlciBwb2ludGVyDQo+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBE
bWl0cnkNCg==
