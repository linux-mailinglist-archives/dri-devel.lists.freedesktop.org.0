Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00683DA6E0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 16:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FE06E048;
	Thu, 29 Jul 2021 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070496E048
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:52:18 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16TEqHGA007037
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=WraBhlfUSiuUNuyN7mOEMKlfWmyudBESIJT5rD2idIY=;
 b=CEGum7DacDNdUfQPZvdMGoA8DttwNq6Rc2YQ6GN0jMfwXe80Yn+X8LbWpizQlAgUssUZ
 lwvB1OlQSMxwqxB1q14W+uA3Jl+oRnZxi4vqs69XoONjswf94rA9ojWoyWYrJRJnMs5d
 Fr34plaJ5DiCfMkfyEmPnT2Yiv8bNHzZKj/hlDhA0Ly7PHs6FLluMRBBBi0MYifvI1Lx
 4Pp0wpfqTH445L9nfoorIMpQ8TEb7Fx+bMDxQ3xCjzjSoLY9WxLTPrRU46TsjGTZrUnj
 pcr9R/Evl4DLbg4r9LdhvDPrVABwcEz+GBdwvMk9uNy5/1P5Moy08trtbwc5Py3ZtlW+ WA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=WraBhlfUSiuUNuyN7mOEMKlfWmyudBESIJT5rD2idIY=;
 b=RHSSqrP25uGMYpPki8pta5UjJ16fZFTNXAFcl18lqyCr+TOQF1gFFbb5cmq4mFoDxnG4
 EWOeQaa/hKdTPNpR19n/WHXIaY5V6zj5vPZl0oapfae3G6evpQ3YvWJbHULZQGQpC9kF
 mqv++GbhTM2zWohvT/OVwWCAWrmTFDIZgO7Khov47ms1DVANMNiNGoMFCJ697aPgUlIi
 fI2xq43wXPu0t8evvjsjf8n0h4SK9ZbIfIV+eqcmA8y3nK7CfJ4keS/g7xZ9vqdbYn7F
 y1csODhTbeUTeLm/nzjYFf75BUT+mFFzRgdhituH87o7+X2op3nu5cFk0LswYNOmCp7x pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a3jpd1ds1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:51:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16TEpp4C193561
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:51:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by aserp3030.oracle.com with ESMTP id 3a234emun6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhK52wvPmOSe7kkNeAcbMWJ82eE2BjFg7Ftv8E+/FUBpBFU+VMIH3eYJ+9eoIOdsvVjNRWK5qkX4pYqTeuDQ/9Axjkp9Hi5Mm2hZlVwrQZ9Bxlgly93XCB6WlSvP4RZFy+DLQ8QDaxjcwfTV3QnGNdRRDQg7kgm+c0WPC3aONrL5m0taApkHPWr/NQq9GpcTWg+YMRtTVcRkUp5lm+0G7lLMe1jh63oSL8uQEb77UEbPkSCNJcK5gf/mZvVWwshQj2RSTk2SxeTHBb+/VNNvdBM5iusQZ9EaDvHwbV7uNDndNz988iSCFVbFwJ4MD/PryqEQR8uWv9a0mGRy1CAY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WraBhlfUSiuUNuyN7mOEMKlfWmyudBESIJT5rD2idIY=;
 b=QNfPBDDdLiXdfXm04M6WdHL6DI3WNncXpzhp/qZ77++p46wT8CUPj5ef4iRwEfYEhwHzimY8PyZXpOsjaB3oUhXiahnI/3rjEBKOh+p+d5vlYlqcHThKQGQ3n6s/bCMUq1V7ht4V0wZmZP6yHqjA8mllu/EJPPCulkB0m98G8/qtsM75i2TnkNAtjp+3VUiZpkbudhcL1qviWBHoGNJQ+9usn+IKfHbdxVrGUsJHSIXyVNmYctiDk91cNQchEDaLzWkw+Jux+PyhTnf+f2UwX0RBf3/+P74W2hXaNxT6XEmkkuURaoytbl/ggBZj1c24wI0lpAtwA5VkLmbJrt6mgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WraBhlfUSiuUNuyN7mOEMKlfWmyudBESIJT5rD2idIY=;
 b=M16IYbUPiJByR4kyRbxCzjp0VXw+0zEYvhs4vfYF0UCrqnofz+be9VgptH2LO69VhTSDoe4p1xSog1Ct8QIZbHbsu0bvubd/VlIX4AuMAGIg4l5zR6qswqwPTl8MCsCoK+F1hD5jRN7TlMVL15RTPNJ8ZZsXqN67HFIH8/+8rJs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2398.namprd10.prod.outlook.com
 (2603:10b6:301:2f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Thu, 29 Jul
 2021 14:51:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Thu, 29 Jul 2021
 14:51:50 +0000
Date: Thu, 29 Jul 2021 17:51:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/vmwgfx: Implement an infrastructure for
 read-coherent resources
Message-ID: <20210729145130.GB25548@kadam>
References: <20210729143945.GA22949@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729143945.GA22949@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::26)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNXP275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 14:51:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef485eb-baad-40be-3b93-08d952a06596
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2398A75C93F556D1C9A5EC2C8EEB9@MWHPR1001MB2398.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2LHt0elW+QCrGghLZr+PVdE/vmQSKifw3fFJLcvSOzXdK2vPKvBtiElgupd0QpofF8/xHgQrzcmiPQo3hKycez9DTOWl/orXTDx+cKHGvdHohxzSUvVFxtzxHZ2ZZhk2cBrj+BFBxYRFMVfVAn1aBfXkyPhgBN7tljXq4gpvvshybt9hQP6EIZ4g6wKdhYogPtH4Y+wjEkK1W8f2sHQYZ2rKxt+MwJx+SsbrlcsCE+WIMjN3IJrjnnJpA3CFU1XhpNH4DisH9DlopG0alTfhwhOngf1IVRN16MN5aRs/Bi+lAoKwfGjf/Ec+gZbI9cHb6mlqTMekdVDoUOjgEZPjdBg6z+lNPctRSBJEqIP6z1LHyBZIdqAbu+gd+ThrdoVxXvQMBAvUU3Rxyo631ljdkrDRsc/XKJD0v2IFZpMFuPyaZZR9gu2/3i26kupkXo79Dly5lJE36su/50NQ34GXmOE18fsi3LSvL+RfoqYJAxpbcWF7phcktjcODFAivs1ReY/LoXxvscvInjnRZCLUEYsFtv+WITjhJhPXMbjnO+kx+mPfIRxFqR4QpyArgz9ppPwRIzczU6BbE+ubjGasAdQ5L8i80ro7D56OY3Y9LdnLHCMrYMRcCa4ENSPr/yGtyaL8GpcgcG5AojODqDgFmqDMo4VwCmTHz1cO58o8IOU6vrRN2ujVmF7fTpDeqBOxcUsFgKQP3hEt1acZYGzvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(376002)(346002)(39860400002)(316002)(44832011)(186003)(1076003)(478600001)(6496006)(8676002)(9576002)(86362001)(5660300002)(26005)(9686003)(55016002)(52116002)(38100700002)(33716001)(6666004)(83380400001)(38350700002)(8936002)(66476007)(33656002)(66556008)(6916009)(66946007)(2906002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rsrOMfmB+m9d/+yhmDmAz8gt8MKlV7Frd5HTnys+E89+2/Vuz8a7rZmzUKV1?=
 =?us-ascii?Q?i0QSyAhm8fGfdZKzG+6H46xMiDv880mBvyIFS2RXIfEFUspxe5Sswdibnptu?=
 =?us-ascii?Q?A1RiVL1H9nPGbq8ihdUPumkqLLCFkbd33bP2kqNLsTFUl1lTRMZ9ZzKT5nas?=
 =?us-ascii?Q?L28N2O14zC3CorPhqfvfXEBgk4pjdBL3iJbH+jdQMJe8U4LJRaJAeDwT6M0z?=
 =?us-ascii?Q?NZXTvIjfSf5JnSuyRirusCchenWRgXMOmJMMUUTu0HAFe3FcLjIuwkqrjDg/?=
 =?us-ascii?Q?/+l6JeV150neBkt8tnZTLSUEp+yOQOcxonvjG23AdQ9AQ5hH0bLZLu/qEd4v?=
 =?us-ascii?Q?9ubn8FyovjY1wn4EJ9OFJpio4p1Wy1EYhquGw47sqDtPw0Vqqkn2QY6nN1eR?=
 =?us-ascii?Q?Kw7RtAc4boM2IEXCEN8L5WgqYiW9nTLWJrkq78z/azoheMKAxxIJYSTSEMJz?=
 =?us-ascii?Q?dGen2eQ82Wj4/nU3HDKYYOedSmYkR5rkpD6RKKfElRMhg7p5AwJwRULi8DbA?=
 =?us-ascii?Q?SBJ8kHSY+gWaJQdQXFY7mPQxP1kmoPDWXNam/P6CWFzPhI/jHk5GosLG+IRg?=
 =?us-ascii?Q?KH1i9xCTmpdQnYb4++Y4/iU+B7YT/0SsHHKRH6Kz2Jbn+vmKn72c39v8TQIB?=
 =?us-ascii?Q?+yq4GwlnhUnPlEB3I+Ea9UklH5AXuYfEBiPjuWNn4u/eZZgOqtnTKSvxrPIP?=
 =?us-ascii?Q?h70CXSjtguSzHhEgCoUR9epEi/IO1tus99MwJrqLNLh4K3zrfVXhe3iHVnW/?=
 =?us-ascii?Q?I+0k48LQLklAB7tnmGikJNlxCBAT1JkT8ilKtXxUTBW1ZNorgawEj4bz5cWp?=
 =?us-ascii?Q?A+AwRFxG4x4HqGRf+VNsclccgzB52Bdgf/t/ez7QoS6Wz+mJZvb8UGPphSuD?=
 =?us-ascii?Q?BxcRwWRCRpyZXYtAlhRSl+Wa23mR9dCkioDylfartTQOHFTBDgAOIZqVh6oh?=
 =?us-ascii?Q?zyQwkWvD/6BOCP9t6CJZGzjSzM1r7Ms0+zDL6DIcryfI6Whdl/7MjtsfwJvc?=
 =?us-ascii?Q?1xLkOoMDel0K8w+j0Qs9r+NpHWUBu+j+LOzLKeYBgISPWdOHpNwGJQNjDvNR?=
 =?us-ascii?Q?Hj83GzT7c76kbBUIpa0/IDg58VIyfEbItrmcaSgHhqcdZg5Gg2r1LKSmHg1s?=
 =?us-ascii?Q?h0p4UCIUetMGhULu945+pxhvzsfuuJzV64WYBo+mkNxe/RKtNcmTSJcdR90y?=
 =?us-ascii?Q?PP2ppJpUTvcU3GTqew8vGiAgdKgDjGVr8LCVh7oGRXSvWAZM5wZZ1/ZsOke1?=
 =?us-ascii?Q?rxjEKwfqb1vwJK7t3SgyCrRkMZVi42u3zuurY9TdZOL3R9UdtfRaP5X7TjKI?=
 =?us-ascii?Q?ZTR+dpnagcC0D9Wzi9uvHJ/9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef485eb-baad-40be-3b93-08d952a06596
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 14:51:50.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zb/2J5LpXzmXP2RkLy9A/wJGHOH93S/so5woR5SL95LOkZradTNcxUJb2xA7Z8eObDhuq1v4a+nyro7B3/R6xQcL1+Qd1rdCJZHslmOlhl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2398
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10060
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=905 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290093
X-Proofpoint-ORIG-GUID: PcRfXh_Vka93KZdQe8_L7p_Myp-RrZTk
X-Proofpoint-GUID: PcRfXh_Vka93KZdQe8_L7p_Myp-RrZTk
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Huh... Vmware is blocking email to Thomas?

"Recipient is not authorized to accept external mail"

This seems like potentially a serious bug and I don't know how to report
it.

regards,
dan carpenter

On Thu, Jul 29, 2021 at 05:39:45PM +0300, Dan Carpenter wrote:
> Hello Thomas Hellstrom,
> 
> The patch fb80edb0d766: "drm/vmwgfx: Implement an infrastructure for
> read-coherent resources" from Mar 28, 2019, leads to the following
> static checker warning:
> 
> 	drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c:461 vmw_bo_vm_fault()
> 	warn: missing conversion: 'page_offset + ((1) << 12)' 'page + byte'
> 
> 	drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c:534 vmw_bo_vm_huge_fault()
> 	warn: missing conversion: 'page_offset + ((1) << 12)' 'page + byte'
> 
> drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>     435 vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>     436 {
>     437 	struct vm_area_struct *vma = vmf->vma;
>     438 	struct ttm_buffer_object *bo = (struct ttm_buffer_object *)
>     439 	    vma->vm_private_data;
>     440 	struct vmw_buffer_object *vbo =
>     441 		container_of(bo, struct vmw_buffer_object, base);
>     442 	pgoff_t num_prefault;
>     443 	pgprot_t prot;
>     444 	vm_fault_t ret;
>     445 
>     446 	ret = ttm_bo_vm_reserve(bo, vmf);
>     447 	if (ret)
>     448 		return ret;
>     449 
>     450 	num_prefault = (vma->vm_flags & VM_RAND_READ) ? 1 :
>     451 		TTM_BO_VM_NUM_PREFAULT;
>     452 
>     453 	if (vbo->dirty) {
>     454 		pgoff_t allowed_prefault;
>     455 		unsigned long page_offset;
>     456 
>     457 		page_offset = vmf->pgoff -
>     458 			drm_vma_node_start(&bo->base.vma_node);
>     459 		if (page_offset >= bo->resource->num_pages ||
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> page_offset is in terms of pages
> 
>     460 		    vmw_resources_clean(vbo, page_offset,
> --> 461 					page_offset + PAGE_SIZE,
>                                                 ^^^^^^^^^^^^^^^^^^^^^^^
> It doesn't make sense to add PAGE_SIZE (which is bytes) to pages.  The
> code in vmw_bo_vm_huge_fault() has a similar bug.
> 
>     462 					&allowed_prefault)) {
>     463 			ret = VM_FAULT_SIGBUS;
>     464 			goto out_unlock;
>     465 		}
>     466 
>     467 		num_prefault = min(num_prefault, allowed_prefault);
>     468 	}
>     469 
>     470 	/*
>     471 	 * If we don't track dirty using the MKWRITE method, make sure
>     472 	 * sure the page protection is write-enabled so we don't get
>     473 	 * a lot of unnecessary write faults.
>     474 	 */
>     475 	if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
>     476 		prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>     477 	else
>     478 		prot = vm_get_page_prot(vma->vm_flags);
>     479 
>     480 	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
>     481 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>     482 		return ret;
>     483 
>     484 out_unlock:
>     485 	dma_resv_unlock(bo->base.resv);
>     486 
>     487 	return ret;
>     488 }
> 
> regards,
> dan carpenter
