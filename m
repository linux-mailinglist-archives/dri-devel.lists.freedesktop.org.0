Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DE253E50
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE356EB2C;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7826EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 07:52:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598428370; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=K8hws+Wc56ot1KHmF6pUD/aHPtRYJTckBNu4n1VnB3Y=;
 b=NBFHesPk3REQlYTnOw4hdoPJK9LSEoufGCja2vL5qdevUdyFfxotBgULK6dbafmhtkoOJY92
 rjbg2/GfbnjXeCmyGr6Gb/QX0nD1WzDyGsNyuQ9HHvzPdAALUmvzHvRMICpPZZe9d0eQOGqa
 bu6PmkUsSk3i510FEwLSWUfKvcc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f4614d2ca327a6430b5d752 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 07:52:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2FC97C433CB; Wed, 26 Aug 2020 07:52:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkrishn)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 32128C433CA;
 Wed, 26 Aug 2020 07:52:48 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 26 Aug 2020 13:22:48 +0530
From: mkrishn@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: add yaml schemas for DPU and
 DSI bindings
In-Reply-To: <20200824225702.GA3460018@bogus>
References: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
 <20200824225702.GA3460018@bogus>
Message-ID: <3016838fedcdd9f34515a74438ea8154@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-25 04:27, Rob Herring wrote:
> On Mon, Aug 10, 2020 at 07:08:02PM +0530, Krishna Manikandan wrote:
>> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
>> like DPU display controller, DSI etc. Add YAML schema
>> for the device tree bindings for the same.
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> 
>> Changes in v2:
>>     - Changed dpu to DPU (Sam Ravnborg)
>>     - Fixed indentation issues (Sam Ravnborg)
>>     - Added empty line between different properties (Sam Ravnborg)
>>     - Replaced reference txt files with  their corresponding
>>       yaml files (Sam Ravnborg)
>>     - Modified the file to use "|" only when it is
>>       necessary (Sam Ravnborg)
>> 
>> Changes in v3:
>>     - Corrected the license used (Rob Herring)
>>     - Added maxItems for properties (Rob Herring)
>>     - Dropped generic descriptions (Rob Herring)
>>     - Added ranges property (Rob Herring)
>>     - Corrected the indendation (Rob Herring)
>>     - Added additionalProperties (Rob Herring)
>>     - Split dsi file into two, one for dsi controller
>>       and another one for dsi phy per target (Rob Herring)
>>     - Corrected description for pinctrl-names (Rob Herring)
>>     - Corrected the examples used in yaml file (Rob Herring)
>>     - Delete dsi.txt and dpu.txt (Rob Herring)
>> 
>> Changes in v4:
>>     - Move schema up by one level (Rob Herring)
>>     - Add patternProperties for mdp node (Rob Herring)
>>     - Corrected description of some properties (Rob Herring)
>> 
>> Changes in v5:
>>     - Correct the indentation (Rob Herring)
>>     - Remove unnecessary description from properties (Rob Herring)
>>     - Correct the number of interconnect entries (Rob Herring)
>>     - Add interconnect names for sc7180 (Rob Herring)
>>     - Add description for ports (Rob Herring)
>>     - Remove common properties (Rob Herring)
>>     - Add unevalutatedProperties (Rob Herring)
>>     - Reference existing dsi controller yaml in the common
>>       dsi controller file (Rob Herring)
>>     - Correct the description of clock names to include only the
>>       clocks that are required (Rob Herring)
>>     - Remove properties which are already covered under the common
>>       binding (Rob Herring)
>>     - Add dsi phy supply nodes which are required for sc7180 and
>>       sdm845 targets (Rob Herring)
>>     - Add type ref for syscon-sfpb (Rob Herring)
>> 
>> Changes in v6:
>>     - Fixed errors during dt_binding_check (Rob Herring)
>>     - Add maxItems for phys and phys-names (Rob Herring)
>>     - Use unevaluatedProperties wherever required (Rob Herring)
>>     - Removed interrupt controller from required properties for
>>       dsi controller (Rob Herring)
>>     - Add constraints for dsi-phy reg-names based on the compatible
>>       phy version (Rob Herring)
>>     - Add constraints for dsi-phy supply nodes based on the
>>       compatible phy version (Rob Herring)
>> 
>> Changes in v7:
>>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob 
>> Herring)
>>     - Modify the schema for data-lanes (Rob Herring)
>>     - Split the phy schema into separate schemas based on
>>       the phy version (Rob Herring)
>> 
>> Changes in v8:
>>     - Resolve merge conflicts with latest dsi.txt file
>>     - Include dp yaml change also in the same series
> 
> I'm done reviewing this because I'm tired of repeating myself and 
> you're
> just throwing crap at the wall and seeing what sticks. Get someone else
> working on QCom stuff to review because I'm done until someone I know
> and trust reviews it.
> 
>> ---
>>  .../bindings/display/msm/dpu-sc7180.yaml           | 236 
>> +++++++++++++++++++
>>  .../bindings/display/msm/dpu-sdm845.yaml           | 216 
>> ++++++++++++++++++
>>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>>  .../display/msm/dsi-common-controller.yaml         | 249 
>> +++++++++++++++++++++
>>  .../display/msm/dsi-controller-sc7180.yaml         | 120 ++++++++++
>>  .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++
> 
> Once again, what's the difference between dsi-controller-sc7180.yaml 
> and
> dsi-controller-sdm845.yaml? I don't see one. If there's not a
> difference, why do we have msm/dsi-common-controller.yaml? If there is 
> a
> difference dsi-controller-sc7180.yaml and dsi-controller-sdm845.yaml
> should *only* have what's different because
> msm/dsi-common-controller.yaml should have everything that is the same.

Rob, The dsi yaml files were split into dsi controller and dsi phy based 
on your comments on patch v2.
As per the comments, I added one common yaml file for controller with 
all the mandatory and optional properties along with their constraints 
and only the required properties for each target is mentioned in the 
target specific dsi-controller yaml file.

Thanks,
Krishna

>>  .../bindings/display/msm/dsi-phy-10nm.yaml         |  62 +++++
>>  .../bindings/display/msm/dsi-phy-14nm.yaml         |  62 +++++
>>  .../bindings/display/msm/dsi-phy-20nm.yaml         |  66 ++++++
>>  .../bindings/display/msm/dsi-phy-28nm.yaml         |  62 +++++
>>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  80 +++++++
>>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  82 +++++++
>>  .../devicetree/bindings/display/msm/dsi.txt        | 247 
>> --------------------
>>  13 files changed, 1355 insertions(+), 388 deletions(-)
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dpu.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi.txt
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
