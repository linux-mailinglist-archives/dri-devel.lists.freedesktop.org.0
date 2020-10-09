Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102D289A89
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 23:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B926B6EE1C;
	Fri,  9 Oct 2020 21:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1196EE1A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 21:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU9FT3AfhTKhNapzcnTVPnmgC1dBgASdRIUKT4IpoxDCoUG5ub6KILRmUWZ+Ru9iypeLBZ7lQnMx8yM/Tc3+eqfQS2O3jwPeDs2wTQ6o3FIfryPMUaHvazxNTBPvRsD+aMQ4nQh5UR73ocwSDgMqweLhBEDLN2sn9JsJM+DsxooIdsaxC4AqyGERTTZMhT8JIVAMELjMNcvrTBAIybMecKxPXbnkx2cbDvN1bb9pd7SiyWbzdKy+kgED+8le5j5/yFAFQWqq3GCnCzcnStrDs0zeM3pi75saS+dws/xUSpN8PE/BI61UQeFThdvjfD2EO8OGEINq0qlmK9nn5Vsjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwLQ8VBexDIhZwsnAv6szEorSZtWS51C9JOH9DTMgrw=;
 b=DUsQDdlGMCaqMJHZAbTWUmpRhtrJOgZrC0xOl058J0NF/mV6QMzaGA90+OixCDf+2pltJUM/yTiDja1ir9f1SSFgkMHpCXpWbCt2Vgd+w8RWX+SYukLnufW8Za9RQKQIIZHDS3edrIzPoiAyYLT49Ch/7ed7wM6ejVddz0h0DLo/J7IeB3L+SZ3fx/NttT9jJF3HSkXCIZnswsiGaApOS4URB1QP4aiRA9dEtPuRp6OUvZN8TD2RnEu6VQD/K9FOMXK9F2JUy6h5aJU4/b9jqI7X9QumKt6Fj/Y8eFAKz3spzjvz3+quERPU49cRjbo5hUKEUj54KqEYYp+ogfR6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwLQ8VBexDIhZwsnAv6szEorSZtWS51C9JOH9DTMgrw=;
 b=W1gzr92zq85he350r3KuPUHyoBm2tZqIL4EaE2hr8Ianm5e5YIpZPziC5lcsaj+qq63OKFrnkrfNEEbekRhI7ufBLopoiRUvsOh16DEE1WTysNMOTS7j8Ib3FQ3ikdnFsfQ30E6dhN7znH9YjcPgp4j3iV7E7dMAkU4910C9VlI=
Received: from BYAPR12MB3191.namprd12.prod.outlook.com (2603:10b6:a03:133::12)
 by BYAPR12MB3239.namprd12.prod.outlook.com (2603:10b6:a03:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 21:22:57 +0000
Received: from BYAPR12MB3191.namprd12.prod.outlook.com
 ([fe80::d8cc:3fcf:b74b:f7cd]) by BYAPR12MB3191.namprd12.prod.outlook.com
 ([fe80::d8cc:3fcf:b74b:f7cd%3]) with mapi id 15.20.3455.025; Fri, 9 Oct 2020
 21:22:57 +0000
From: "Li, Roman" <Roman.Li@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/display: Fix module load hangs when connected to
 an eDP
Thread-Topic: [PATCH] drm/amd/display: Fix module load hangs when connected to
 an eDP
Thread-Index: AQHWnoG47tA65QS+kUqzcrY9kU6VPqmPxyyg
Date: Fri, 9 Oct 2020 21:22:57 +0000
Message-ID: <BYAPR12MB3191CCA347562D06D13BC19B89080@BYAPR12MB3191.namprd12.prod.outlook.com>
References: <20201009211759.2106060-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20201009211759.2106060-1-Rodrigo.Siqueira@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-10-09T21:21:06Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=b2da8062-8b43-4c34-b062-79db4c4e2d5b;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c38f34b-49b8-49f1-04ba-08d86c997e59
x-ms-traffictypediagnostic: BYAPR12MB3239:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3239574FE5DA1363F8F71E8689080@BYAPR12MB3239.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /oOIrZ6doBAY2/Ruq2PHlsndXJ1uJGMe+qAVtj4mclNGWdhYhoQ6lZTVblhq/mqg87j3NkBnKUujMZxqNt2Rb7cnt+CHFAblYPbUiMNdxOT3lfAjAJASzwHttT85QkWqCG2NcBhYagcOyNrAUttsJz2X1BJFyhdRXi7Yd9E9QpLpbJ4uZ8lJrmPnm5VKYLVn14CiDUjdOvNZ0sjmyUGsTk6Kz0Z3wzJOo/DBo3E4gscNTw9fbM4HOh78XFxh7Sd2cMr11t0yaURP1lpMRiZg+QVABrZHYN9nP/clQSjBUFWGS+IjDm7t9D1qAdFPvrWdDOpYW3zB53I3Qt7loXhppQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3191.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(9686003)(478600001)(55016002)(76116006)(53546011)(6506007)(52536014)(66946007)(66446008)(66476007)(64756008)(66556008)(5660300002)(7696005)(110136005)(26005)(86362001)(54906003)(71200400001)(316002)(2906002)(8936002)(186003)(83380400001)(8676002)(4326008)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: M9XCrkgNxnxHrFqHkTY2/BD81R3pir/+t0yYZrureXFeDEy5SM2c4oPoYpe0Ez96WIPrLGekWPpG23+AH+PaG9GUdNKFRxsxBaOXd3G1Aze+qwI0XfO2ewyKtuNKZJg1+AdeIrhiDbsCzdapTBBYUh3TX0Rpvgf/qrVGL9dR3gUYgy3RTvv7g/RvzHzr3m9DVbDXNV4fKaGPdLi4TjrMBGyOHUBr7jRlQlmtk+ILm8Wz189ct9pgKvTrJv4zyBv/E6wh7qq2zQ9wACID+UL2OE9X0v31hdlZYLr70qW5B3RJSPj2r9cjQ3Cx6IOrZf00UeTUYN3l0HOH00LL9OQly1H0WYDBXLeJJ+oyjkp/REiMYS6soBpmyNo5s+uF/YziggGqwcu39jOrOXoBSezpp9bKA3dcFFb7flRzSlfLF05zYh8pfvTnT5cbFcpuddg4uc4khXDWjVSaJhiRi3sDjJ0t+qD1KA5i3oNKMIXja1H0TEDNKCJJUt6anvfLiB3OhSffRJTAG2CFY/a9rrbBE8t7k2fm5XEwbFvV5Ob17uzcHZi8GZ0rnV0t8mDwOX0au7h505TtiYIgvnO1tpYwtazK9SP6mtHbVSK0WsmmzhruA71sUVBFVn0VHnlH1azSNMYLXwXvMylgzWqZUHG/Fg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3191.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c38f34b-49b8-49f1-04ba-08d86c997e59
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 21:22:57.6775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7KWR5hDl8IO05XpPq1zBAVLA1W+3/wYyi+F8DWda4M8bznGVXPIQ1bGxoZUzMrs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3239
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Reviewed-by: Roman Li <Roman.Li@amd.com>

-----Original Message-----
From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com> 
Sent: Friday, October 9, 2020 5:18 PM
To: dri-devel@lists.freedesktop.org
Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Li, Roman <Roman.Li@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Subject: [PATCH] drm/amd/display: Fix module load hangs when connected to an eDP

It was recently introduced a change that enables driver to disable streams if pixel clock changes. Consequently, the code path executed in the disable vbios function expanded to an encoder verification part.
The encoder loop is nested inside the pipe count loop, and both loops share the 'i' variable in control of their flow. This situation may lead to an infinite loop because the encoder loop constantly updates the `i` variable, making the first loop always positive. As a result, we can see a soft hang during the module load (modprobe amdgpu) and a series of dmesg log that looks like this:

kernel:[  124.538727] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[modprobe:1000]
RSP: 0018:ffffabbf419bf0e8 EFLAGS: 00000282
RAX: ffffffffc0809de0 RBX: ffff93b35ccc0000 RCX: ffff93b366c21800
RDX: 0000000000000000 RSI: 0000000000000141 RDI: ffff93b35ccc0000
RBP: ffffabbf419bf108 R08: ffffabbf419bf164 R09: 0000000000000001
R10: 0000000000000003 R11: 0000000000000003 R12: 0000000008677d40
R13: 0000000000000141 R14: ffff93b35cfc0000 R15: ffff93b35abc0000
FS:  00007f1400717540(0000) GS:ffff93b37f680000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005649b66b0968 CR3: 00000003e0fec000 CR4: 0000000000350ee0

Call Trace:
 amdgpu_device_rreg+0x17/0x20 [amdgpu]
 amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
 dm_read_reg_func+0x3a/0xb0 [amdgpu]
 get_pixel_clk_frequency_100hz+0x30/0x50 [amdgpu]
 dc_commit_state+0x8f1/0xae0 [amdgpu]
 ? drm_calc_timestamping_constants+0x101/0x160 [drm]
 amdgpu_dm_atomic_commit_tail+0x39d/0x21a0 [amdgpu]  ? dcn21_validate_bandwidth+0xe5/0x290 [amdgpu]  ? kfree+0xc3/0x390  ? dcn21_validate_bandwidth+0xe5/0x290 [amdgpu] ...
RSP: 002b:00007fff26009bd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055a8025bea50 RCX: 00007f140085c89d
RDX: 0000000000000000 RSI: 000055a8025b8290 RDI: 000000000000000c
RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000000c R11: 0000000000000246 R12: 000055a8025b8290
R13: 0000000000000000 R14: 000055a8025bead0 R15: 000055a8025bea50

This issue was fixed by introducing a second variable for the internal loop.

Fixes: 32933ac6ec3a ("drm/amd/display: disable stream if pixel clock changed with link active")
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8d96ef157987..3f7d04b8956a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -848,7 +848,7 @@ static void disable_vbios_mode_if_required(
 		struct dc *dc,
 		struct dc_state *context)
 {
-	unsigned int i;
+	unsigned int i, j;
 
 	/* check if timing_changed, disable stream*/
 	for (i = 0; i < dc->res_pool->pipe_count; i++) { @@ -872,10 +872,10 @@ static void disable_vbios_mode_if_required(
 
 			enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
 			if (enc_inst != ENGINE_ID_UNKNOWN) {
-				for (i = 0; i < dc->res_pool->stream_enc_count; i++) {
-					if (dc->res_pool->stream_enc[i]->id == enc_inst) {
-						tg_inst = dc->res_pool->stream_enc[i]->funcs->dig_source_otg(
-							dc->res_pool->stream_enc[i]);
+				for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
+					if (dc->res_pool->stream_enc[j]->id == enc_inst) {
+						tg_inst = dc->res_pool->stream_enc[j]->funcs->dig_source_otg(
+							dc->res_pool->stream_enc[j]);
 						break;
 					}
 				}
--
2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
