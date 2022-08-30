Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7295A65FF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375410E0C9;
	Tue, 30 Aug 2022 14:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA2710E064;
 Tue, 30 Aug 2022 14:13:54 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UDmuwG024127;
 Tue, 30 Aug 2022 14:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=GSccCUr3jvU8PzwPNoLHOxi7owSGzTr64+OaSzU35Qg=;
 b=ykXH2VK2mhzRnuQQqmDaQ31piJ6XfGFJuFnpWfLWKlkV6MUHkSZ6uAD0IShuLeTrIQ/j
 5iMkuNmwDqVyx75mnBBXIj5uk1D1YImKPnxPEZyofe4U88YFo8EWS1eYjIxLkZLYPEfJ
 9mHcnP1TOhD9vA69znPP/tATOIF0PtiaHjBh9vSnOE6uHZmeWG3oWnmmfcM4YUcfqWYk
 GrATH0cEBcopFyStGPqS2GvryXDJCvt48mONDMohMn/f5PUMs7Y8bJQw/Q+R4Ejh+K0H
 e/0COmRV63RnzpTa+ubAsQjjdBav1WrawOant8D2r1yfVAk+qpoiceHKWEyQAlw3Vzbu AQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7a226ga2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 14:13:50 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27UCgVf4022140; Tue, 30 Aug 2022 14:13:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q3ycrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 14:13:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBgfl/U3Gw8jNxN1qE+SRi6JhWfqGQCS1V230+vOuww9vp7Pbt0tDTPI27rYyo1ngCnzvjpO0C3Zy4fqtKSiGBRhEyGPSCCpiDNiPBYISOXQbFpKnHeEFKjdP7sLDraEqo+2+Mr1lLLtvkyY5D43sYbdv2ILpzSKc/6f10mfZGKin7SX72+/jZ1lNK1CaxrP9FjUhyAhYcrtVzPaBHxqKOR5qP9/fm1LJmp1vo2+igIWFQmiP6iBiBZE6T0Ms28fJcZCUFlA43PbXvaLg3nAtQRcTHpdKRpMyLgw6mh4xRJ6YV1mw3Mz1Oe4m7+fYEDPVG+i4xmSpUVOYNCPhWrZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSccCUr3jvU8PzwPNoLHOxi7owSGzTr64+OaSzU35Qg=;
 b=mqWk0ldo29LEw2KXiHtcEJp5uCp6MNbPsly6NfkaAVQ0TWdkgAyPNxkZzs4AtJXtDrv/TBkDagrV1e8rOepFnx48Ateis1RgEcaVx5cH8botXFRD8wTyJN1Wiz7CYMojA3rIgsGju9ayUyBV2+7VnhzMnDmRRMjVzVqTpoQhF0q+NV95KAt3rEXiXoaq1M8ZuVWTbKtQ1TSYW2CNxKO5rQ2lwWtwwqVwbRbd3R7mnB4u9bNtYY1fU0vD2AV237gIi2HEfoxHh+YcJoU5DSiH234M1TlKc4EmG1ykRfHlmbY1He3l0oE5OtpgjXzilbFAtvvy1x+L3qT897Xco76lXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSccCUr3jvU8PzwPNoLHOxi7owSGzTr64+OaSzU35Qg=;
 b=DueBNoGq4pF2g2fFFM09MWktn9TS36SBLSHOTn3zgJf8avvCK1K/wLtVyy4h/5tFtfiNtkNetkEU0xe+pTmj/6uLRxQMV600O547qmiHuadwoxMWZZk+hW4msS2baBHSVbGkuuPkhX95Tf/OdsdA04rIELOgqo4wLqHDQkfgaBs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3983.namprd10.prod.outlook.com
 (2603:10b6:208:1bd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 14:13:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 14:13:46 +0000
Date: Tue, 30 Aug 2022 17:13:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [drm-intel:for-linux-next-gt 1/1]
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:497
 intel_guc_slpc_set_min_freq() warn: inconsistent returns '&slpc->lock'.
Message-ID: <202208301957.uLAOt2oy-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68e9d182-0ea7-4b52-6d53-08da8a91da30
X-MS-TrafficTypeDiagnostic: MN2PR10MB3983:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2A6ePgeXoxTgDoh0S2dZE8ZLaRnqtnwcODbTtHs4NPYuo8RIeD37Yf/LrGuO8FB2KyZw2/KARVhxDDFInRXxgO5IUsqixbxKt56Mlb7wKUULzao5OuxXwAi6LIJMkL/S+bO0omyoXbp6qLkhn+ykFmewaARkt/G01Pnfww0oVB8gg/QPoQ0tp45GCGlO5JxHpjzumKFG1bcpt0exl0G70v3TGF0NDs/MeOFAaopfpsDoPEkd0VIkjRaEOFZtenC7EBNcY44uCe0/psJylZWkmYKDJEeRcgMXGGhbiBTckMz0BF0MH74uP/RVievIMJE+7ycmK5xOyYQoR+cRMEsUs3077Q4WoalERwQjKMmwgUzrax/CuWS77b1jT/jvvCfkhhzLg3pGXyX+Sj4OK592izehdDTKveCU6MEtX2y/lpAJhmzpy3T3Cy+HwYHaj2Qv/eYaiNoax8O/4jjKnvNrrgTHPY5jNRaDlNisXFJthVvfRFGWGynhuCwZ/6MgBTrXz4x+xSOLdd0NxoRinx0ZMoFNN7/f70z0zqpICL15Q4/QKEvWluwYpUCJJ8VOdEe6RajDwQ2oHnbdZRsxo/QCkdd+b7fxV7VdNQogoxNYJoPq1DGHAeMx74M44lG01ZbBlJj7OxqZPvDjCiIm6zzeba2q7oGI/omLAVkutREKJv+pIB/2DbLvKAmIcqaW1K/rnHzpe6GRQnTf6QEVEaJRajOq1Gd8WGFenyC+MnLTv8DhwktXTxd2CN4mL1f43F23uhu8jQouxUllNQy14nxk3YKwRTzIaf6a1gHr16G0ZC1SGPbFDk1fg8ccfFwUSljnPsGkUFlopbghit48TRRdwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(346002)(396003)(136003)(376002)(6506007)(38100700002)(83380400001)(2906002)(6666004)(38350700002)(52116002)(44832011)(9686003)(6512007)(186003)(86362001)(8676002)(4326008)(66946007)(66476007)(66556008)(6486002)(1076003)(316002)(37006003)(26005)(6916009)(966005)(36756003)(8936002)(41300700001)(478600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/a4X9BDH50TJZGqcZ3nrs7MNcTOU69iFivOD1z8crTYn7GJBJI1Xy7SBKhnC?=
 =?us-ascii?Q?Ypk/fHVQPt1k6iizcomKxNjDGrm8Lmpzm0a0vfk2d4WW4qLFzW2NYYL+3ZwS?=
 =?us-ascii?Q?JShR4yipa/1mmdVcGTRitE32kvyvuhhOQ89UTLWYnf6K5r9j31noi2lVAwAK?=
 =?us-ascii?Q?3OcOt3PMXckPXDMize2L9OLLy3e8o4lvsaHn9zsj/c9TeEMJMPH5FQrFWWKX?=
 =?us-ascii?Q?a8lQXdQYWACBALaQs22pGM21W+WSZ6y5Ds6fFW6/tEcl3yZF5PSZreHnlH7m?=
 =?us-ascii?Q?LM9npjT13hWw/xyh0TpnPjLJGeETRUlZi8sPdvCQ1BdMEYfRW+tfxoOpCBan?=
 =?us-ascii?Q?q1B5eeylQ+J2+kp6XVGBNRaFAFX/e5JmipQaY77qoNyWK3/QaD8iyo29Lpnq?=
 =?us-ascii?Q?u1LznlyeHmUz+OSAe4W6WibhzxlRFpK5Oz7wsg192zk2BSpI1jbJABPJMuRb?=
 =?us-ascii?Q?J0e/PahP86Q0a3X6uLJmDiLMQBV0Ct/L/tLpMkOIqrs1T7iabEMr0nZLxvwI?=
 =?us-ascii?Q?47SORPIO8v90MSREkjP5XnCl1Oef3/Bqnmo9o1htzFlVh4OwRx2+J0bDlxqu?=
 =?us-ascii?Q?1dcxdI0ZzV5OqkGCWQdD4qT0nVyGSjsFRYqk4EurR/aztUaP6lp02RI04nM7?=
 =?us-ascii?Q?8foHV9OiDfyPOdnoSDFmZquAoeskeBYwpMTULi0kJftWXr5IGX0g+c+TWCHG?=
 =?us-ascii?Q?hVixGoLF4vIsRAsFHstMpfuX/qatG5hEar++2LG9qLjplff4VdgN+FXdJ/he?=
 =?us-ascii?Q?AUgSH0EFnfmUiw5tvcbiovjiMIac3EB0ACUV4mcfxqV4OHxTHRiNkShBdtzw?=
 =?us-ascii?Q?eYpsguglAhbKzr3Zy9o5n9ImuMw55WXBzI1V5eweod8DSjnP7byBlSpp1w8h?=
 =?us-ascii?Q?3I/qeeiUU6t8cVQszYacOtHcFBYARi6o0mN7b9aXCdUMHAvqHdU/Dy95K0Km?=
 =?us-ascii?Q?tEZftNIN56+5KbMeDKcMjyAr3cyRMZUUSy1JwwrkqKwicXB6rhPTKTHmczWH?=
 =?us-ascii?Q?+ZTae8CuvQZZjFic3quuqzXppc/UN4EHSNMk+JuSCXECYcUlj1BmN6fq75Q7?=
 =?us-ascii?Q?pnDiwjHIkw0JaQW5nQjdnnrSZceBUlBSVeTsej+sPZeYwJYCsAAiwW+J3116?=
 =?us-ascii?Q?S+jRK+2XHRu/X2dbE0w8Iku+Krtr6BdxMtURv1dmO76PPVGvRZVitr3OuLIR?=
 =?us-ascii?Q?bFlAB1lfXZfsh865ypPvAhZ1iF2WgiujT3TOGCfl+xZa8pRG0Jc6Dsa5qblT?=
 =?us-ascii?Q?0wJ/28jMiooINU4mhb+ExqQZsXua9nQFh0xbM+dhKXyDYyAdSgETnNKQ2ZBl?=
 =?us-ascii?Q?8wmXysOxAgGDRaDT4dazPjwap501I7Py+XmP+Vl5QaDAo2N566F7+cbty9IB?=
 =?us-ascii?Q?R2l7muuza3o+kuF08DQoH1mg8q/Fbd9nobhdHsPlXYQz93Fd8C73ydhwOJXW?=
 =?us-ascii?Q?unRa+zcXfct1TA1nbdxujnePq/gf4X4hKYgCYE3VjpMvnavOd1TJ/IyKrSmp?=
 =?us-ascii?Q?B9/VdEdP6no6YkRT0rEZ8OjOODSt85ua2W55oRK3PHFpOpKGRhKWoukpTquy?=
 =?us-ascii?Q?Q2rFY/1PAkuA7lT3/FwZ6hF7N1feaZIeKzuGuTCN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e9d182-0ea7-4b52-6d53-08da8a91da30
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 14:13:46.6531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnU9vJTPa15mhEo63YGCxu5MtuigwtusjWXbxAmKKXUXNZzqrHH+6K6dpIu7zkiB7aytSeAvpxJ+kMnM2cIxxOXtDMAgLKIcMXE8Zcv58f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3983
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_08,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208300071
X-Proofpoint-GUID: tq-urx9nR-puejbAD5OIog4aGCl_pSPb
X-Proofpoint-ORIG-GUID: tq-urx9nR-puejbAD5OIog4aGCl_pSPb
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org, lkp@intel.com,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   f54e515c91806288126f64b37da0c78baa2d8c1f
commit: 95ccf312a1e4f5a1150dd1a0a2d81c1043e33fb6 [1/1] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
config: i386-randconfig-m021-20220829 (https://download.01.org/0day-ci/archive/20220830/202208301957.uLAOt2oy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:497 intel_guc_slpc_set_min_freq() warn: inconsistent returns '&slpc->lock'.

vim +497 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c

d41f6f82d319ca Vinay Belgaumkar 2021-07-30  457  int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  458  {
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  459  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  460  	intel_wakeref_t wakeref;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  461  	int ret;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  462  
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  463  	if (val < slpc->min_freq ||
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  464  	    val > slpc->rp0_freq ||
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  465  	    val > slpc->max_freq_softlimit)
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  466  		return -EINVAL;
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  467  
493043feed006f Vinay Belgaumkar 2021-11-01  468  	/* Need a lock now since waitboost can be modifying min as well */
493043feed006f Vinay Belgaumkar 2021-11-01  469  	mutex_lock(&slpc->lock);
493043feed006f Vinay Belgaumkar 2021-11-01  470  
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  471  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
493043feed006f Vinay Belgaumkar 2021-11-01  472  
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  473  		/* Ignore efficient freq if lower min freq is requested */
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  474  		ret = slpc_set_param(slpc,
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  475  				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  476  				     val < slpc->rp1_freq);
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  477  		if (unlikely(ret)) {
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  478  			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  479  					 ERR_PTR(ret));
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  480  			return ret;

mutex_unlock(&slpc->lock); before returning

95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  481  		}
95ccf312a1e4f5 Vinay Belgaumkar 2022-08-19  482  
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  483  		ret = slpc_set_param(slpc,
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  484  				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  485  				     val);
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  486  
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  487  		/* Return standardized err code for sysfs calls */
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  488  		if (ret)
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  489  			ret = -EIO;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  490  	}
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  491  
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  492  	if (!ret)
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  493  		slpc->min_freq_softlimit = val;
025cb07bebfaf9 Vinay Belgaumkar 2021-07-30  494  
493043feed006f Vinay Belgaumkar 2021-11-01  495  	mutex_unlock(&slpc->lock);
493043feed006f Vinay Belgaumkar 2021-11-01  496  
d41f6f82d319ca Vinay Belgaumkar 2021-07-30 @497  	return ret;
d41f6f82d319ca Vinay Belgaumkar 2021-07-30  498  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

