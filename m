Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D805A1C04EA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 20:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138E76E948;
	Thu, 30 Apr 2020 18:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F716E948
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 18:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJ3xJA1ksT9AHRv1LgsrgnBnDogagHy/lYonPHrH+O60VbecLP9IeAKkIoo1a6jKSTErSF83Nc3e62oFvSf66jfTTOVQ6ZhjogtRkt42PmsaAszQR1UQDfv/iBS1YUTTZH48xNKN8YHWVui93SM+q/FxTGic/MEbc6ZYXsroC/l01wdlGfnix0YjvvUls53S9kGeVkFBiSMZrQ9IQiswowYwab9dnnSZvuZAhWSMHTN8UfjafTIQ/Rkv65uBZiQUQ8XyZlehNc84DQDuZGB2ytfA30eQaecZMEErFJ6yyZpqrls80rbXoB29t9Ch2HRtckkmaPlOwb1ZUmeKT1rc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQz3SfXC8xH58cTMs4KgzBAXAPd1br7IYY09P4+z4pY=;
 b=OEFt1j6gmooMrAlEVJS+iOehsEzb+7lpkQX1mlgJtuks7u/0SEXJkJYEod5hRj8vepZTAcJ6aX+FEY/0xKOlmYPebMjwYIG28EZajKruShu8WB9KHwbUquZ5VLKZIUdvoSIZAgpxvlvHOnZAH0rk0B5SixgjPIutQZ0V9McvMupqzeBpZPdrsWPzDc0b/1GC//NCeGpFda99QVw2B8eJ8eCZ0X5SutlWGl+WLBWBiSulo0s56uSg1LLT16s6t/sn4H8snLThWEn0h+aXs2H6qiMq9tiGrSgDuBe6z/YQ75nyPAX2s0Eic8gRF2t6iaUJFHV3XoF31TmysJmzVyoA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQz3SfXC8xH58cTMs4KgzBAXAPd1br7IYY09P4+z4pY=;
 b=DqtFJjy/Jl8KsXq3AFBZYYe6zjTopQLIwABa4PJx7aeMsRCaUE/L24HdD9L0fmfcxrcula0THHR9yJMPYeGxQD03U0bHSrQ7bMSfOYTIKXKC890PQF43v6oGKfH0yADnEUq3NMhTC47vasFACuFr9tPAiP5zQc33p6mu/JghuTg=
Received: from CH2PR02MB6871.namprd02.prod.outlook.com (2603:10b6:610:8e::22)
 by CH2PR02MB6053.namprd02.prod.outlook.com (2603:10b6:610:1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 18:36:16 +0000
Received: from CH2PR02MB6871.namprd02.prod.outlook.com
 ([fe80::d8a1:61f0:62fa:6afb]) by CH2PR02MB6871.namprd02.prod.outlook.com
 ([fe80::d8a1:61f0:62fa:6afb%4]) with mapi id 15.20.2937.028; Thu, 30 Apr 2020
 18:36:16 +0000
From: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [RFC PATCH 1/2] dt-bindings: display: xlnx: Add Xilinx DSI TX
 subsystem bindings
Thread-Topic: [RFC PATCH 1/2] dt-bindings: display: xlnx: Add Xilinx DSI TX
 subsystem bindings
Thread-Index: AQHWF1mgtcGXqNzhbUWuhXXWg2URMqiKUbGAgAe4HxA=
Date: Thu, 30 Apr 2020 18:36:16 +0000
Message-ID: <CH2PR02MB6871C64BB88CC9E00736C2E7B1AA0@CH2PR02MB6871.namprd02.prod.outlook.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200425202919.GA18024@ravnborg.org>
In-Reply-To: <20200425202919.GA18024@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [117.98.214.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e50e9408-0769-4656-4296-08d7ed355e4a
x-ms-traffictypediagnostic: CH2PR02MB6053:|CH2PR02MB6053:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6053E14CB9039C1193EFF1FBB1AA0@CH2PR02MB6053.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6871.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(7696005)(186003)(26005)(4326008)(55016002)(9686003)(5660300002)(6506007)(478600001)(33656002)(54906003)(966005)(2906002)(66446008)(64756008)(52536014)(316002)(8936002)(8676002)(66476007)(66556008)(76116006)(6916009)(66946007)(71200400001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKnPpPig+z7Twvru9KXtcKD+F6nolcJr7AgdRVI80IXX5hkP/05wFHaD0hwANy30SFNNXvc/+s/rA2f0dMyaRSw8NPBu5W49e8CcZyZBTnPdch4IHjI7dfqcFA1fBv0T36ytnUXlLnBjiYfnbcA2uYh9qBdoU7DdOKBuKH2wKnINQCDNrp0sMBQsRSN4JFlJ27htpwdKFi0K8cUs5kAPZK8WMMRXm+31gD65DYUXFl0PPfkNJkkqYpVsX++bap3oe+3ibDEVdHl5+dWgteJNlumMeAA9uMCWCtRaXYYPBvsaMpu6iJbBqsRgIVlovprk9SUkAtc8qk4jRC4t9ffQ72ryyio+v75ITmu4YTMFyEe1k95DNDcGqrfsVt5IQGhLaTJoBFkmCIb33x24x+kUlaB+aM8HouazDqN0Jpn4qLh0rqfl/PKO+JqVdBC/QPLrGvyxWQcPucKp0rPdTEILv/TWeN/Kh/8dJlVHOf7mhj8=
x-ms-exchange-antispam-messagedata: iADqQYkdTdgzb5oX/xCPyTrSZ/45jgxIPl0pg/gLMr4jIWpyYczdf8S1j/+/RV1uUSE4OJNTBAdUgXev1oNke9CpyXW+tsMQLezJORpsHvSWnXHLN8KkZgZLolF+PTmHOIBmLLsVmnkAnGeHCAzg0HrGW9vFKmC5L6zB0EQ8jNjSlbT72GATedxZ6WxhBvMVm7KrzTa4VXJIBNvhEfRf5ijkLZvfkuswmczBYzgFBSzHjRUUNMf4jsr5vkqqOs7VTyYZLk0OB2MgCHnS4WGY1g0MWTE2aoCh2C8ODwgx79YZKCVQIkzRlwCoZ3TQ2gcGOqKEA7EAUeM4fMbbD/9rvXIFmzUtYbCfmdqqVTX788OWJTqG1zjUqO1vyRmD5eiiawCWH49lfWDRc/ekHPdtAtQocKSt97JkUUe08hBciJQkf6htAbITFma7WkamVU0DN2v+zUXov5gaYwgtXZ+M2HkALM63SB3IpLLly6MIcHFPoTDOOTyIJtYY2h1W2YoWT/eaQEf6/Raq4ByNs89wp0FOR5Hl3vF+/Alrq4ovhoHnZGhiJFapoyzWSpVT6lYPDB4xAVxGqf6/j5c2AR3eIRdVEHX3Cdox31NUdFxqcmHpQAFTpOz2KAsTAYHlrYh3UDDNr7+gqd6Fhs1N2huOiiwjXWwhppyxQ/YYWm44VHbzKAkhc8YVlSoIW5IqDzUbAhjNOgpmMucfPfbyaSKCllUyAr069refrroOKpCrJ8i9wxf2aMW2/To1Omeg0LYo68nUB7mQpoqoDf7mxlRHt8W1R9U4XYp5LYqW1oopUW0=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50e9408-0769-4656-4296-08d7ed355e4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 18:36:16.6153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lL/XSd53dUcwFOP0bDYmU7VURbe23QtVzM1N/Y9sBtF+xisSmYOmVuJHL3qplY2Xjaa8J/a/UKkUh8SWeJktzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6053
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
Cc: Sandip Kothari <sandipk@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam, thanks for your comments.

>-----Original Message-----
>From: Sam Ravnborg <sam@ravnborg.org>
>Sent: Sunday, April 26, 2020 1:59 AM
>To: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
>Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com; dri-
>devel@lists.freedesktop.org; Sandip Kothari <sandipk@xilinx.com>;
>airlied@linux.ie; linux-kernel@vger.kernel.org; Venkateshwar Rao Gannavarapu
><VGANNAVA@xilinx.com>
>Subject: Re: [RFC PATCH 1/2] dt-bindings: display: xlnx: Add Xilinx DSI TX
>subsystem bindings
>
>Hi Venkateshwar
>
>On Tue, Apr 21, 2020 at 02:50:55AM +0530, Venkateshwar Rao Gannavarapu
>wrote:
>> This add a dt binding for Xilinx DSI TX subsystem.
>>
>> The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
>> implements the Mobile Industry Processor Interface (MIPI) based
>> display interface. It supports the interface with the programmable logic
>(FPGA).
>>
>> Signed-off-by: Venkateshwar Rao Gannavarapu
>> <venkateshwar.rao.gannavarapu@xilinx.com>
>> ---
>>  .../devicetree/bindings/display/xlnx/xlnx,dsi.txt  | 68
>> ++++++++++++++++++++++
>
>Sorry, but new bindings in DT Schema format (.yaml) please.
>We are working on migrating all bindings to DT Schema and do not want to add
>new bindings in the old format.
>
I will address bindings in YAML format in V2 patch.
>
>>  1 file changed, 68 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
>> b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
>> new file mode 100644
>> index 0000000..ef69729
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
>> @@ -0,0 +1,68 @@
>> +Device-Tree bindings for Xilinx MIPI DSI Tx IP core
>> +
>> +The IP core supports transmission of video data in MIPI DSI protocol.
>> +
>> +Required properties:
>> + - compatible: Should be "xlnx-dsi".
>> + - reg: physical base address and length of the registers set for the device.
>> + - xlnx,dsi-num-lanes: Possible number of DSI lanes for the Tx controller.
>> +   The values should be 1, 2, 3 or 4. Based on xlnx,dsi-num-lanes and
>> +   line rate for the MIPI D-PHY core in Mbps, the AXI4-stream received by
>> +   Xilinx MIPI DSI Tx IP core adds markers as per DSI protocol and the packet
>> +   thus framed is convered to serial data by MIPI D-PHY core. Please refer
>> +   Xilinx pg238 for more details. This value should be equal to the number
>> +   of lanes supported by the connected DSI panel. Panel has to support this
>> +   value or has to be programmed to the same value that DSI Tx controller is
>> +   configured to.
>> + - xlnx,dsi-datatype: Color format. The value should be one of
>> +"MIPI_DSI_FMT_RGB888",
>> +  "MIPI_DSI_FMT_RGB666", "MIPI_DSI_FMT_RGB666_PACKED" or
>"MIPI_DSI_FMT_RGB565".
>> + - #address-cells, #size-cells: should be set respectively to <1> and <0>
>> +   according to DSI host bindings (see MIPI DSI bindings [1])
>> + - clock-names: Must contain "s_axis_aclk" and "dphy_clk_200M" in same
>order as
>> +   clocks listed in clocks property.
>> + - clocks: List of phandles to Video and 200Mhz DPHY clocks.
>> + - port: Logical block can be used / connected independently with
>> +   external device. In the display controller port nodes, topology
>> +   for entire pipeline should be described using the DT bindings defined in
>> +   Documentation/devicetree/bindings/graph.txt.
>
>> + - simple_panel: The subnode for connected panel. This represents the
>> +   DSI peripheral connected to the DSI host node. Please refer to
>> +   Documentation/devicetree/bindings/display/mipi-dsi-bus.txt. The
>> +   simple-panel driver has auo,b101uan01 panel timing parameters added
>along
>> +   with other existing panels. DSI driver derive the required Tx IP controller
>> +   timing values from the panel timing parameters.A
>Please always use either a port or a ports node.
>
OK.
>	Sam
>
>> +
>> +Required simple_panel properties:
>> + - compatible: Value should be one of the panel names in
>> +   Documentation/devicetree/bindings/display/panel/. e.g. "auo,b101uan01".
>> +   For available panel compatible strings, please refer to bindings in
>> +   Documentation/devicetree/bindings/display/panel/
>> +
>> +Optional properties:
>> + - xlnx,dsi-cmd-mode: denotes command mode enable.
>> +
>> +[1]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
>> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +Example:
>> +
>> +       mipi_dsi_tx_subsystem@80000000 {
>> +               compatible = "xlnx,dsi";
>> +               reg = <0x0 0x80000000 0x0 0x10000>;
>> +               xlnx,dsi-num-lanes = <4>;
>> +               xlnx,dsi-data-type = <MIPI_DSI_FMT_RGB888>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               clock-names = "dphy_clk_200M", "s_axis_aclk";
>> +               clocks = <&misc_clk_0>, <&misc_clk_1>;
>> +               encoder_dsi_port: port@0 {
>> +                       reg = <0>;
>> +                       dsi_encoder: endpoint {
>> +                               remote-endpoint = <&xdsi_ep>;
>> +                       };
>> +               };
>> +               simple_panel: simple-panel@0 {
>> +                       compatible = "auo,b101uan01";
>> +                       reg = <0>;
>> +                       };
>> +               };
>> --
>> 2.7.4
>>
>> This email and any attachments are intended for the sole use of the named
>recipient(s) and contain(s) confidential information that may be proprietary,
>privileged or copyrighted under applicable law. If you are not the intended
>recipient, do not read, copy, or forward this email message or any attachments.
>Delete this email message and any attachments immediately.
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
