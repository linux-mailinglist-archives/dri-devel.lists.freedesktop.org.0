Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D787DD4C2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0690A10E11A;
	Tue, 31 Oct 2023 17:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 20844 seconds by postgrey-1.36 at gabe;
 Tue, 31 Oct 2023 17:35:47 UTC
Received: from 10.mo583.mail-out.ovh.net (10.mo583.mail-out.ovh.net
 [46.105.52.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE3610E11A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:35:47 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.132])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id D9554289FD
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:00:39 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-cgrz2 (unknown [10.110.171.20])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 468BC1FD22;
 Tue, 31 Oct 2023 17:00:39 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-cgrz2 with ESMTPSA
 id USdVEbcyQWVsPwEAnliliw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 31 Oct 2023 17:00:39 +0000
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 19:00:39 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/radeon: replace 1-element arrays with flexible-array
 members
In-Reply-To: <CADnq5_M237bNMn=RZvBvPm4vymmUO07Xum7OQehhtAq2Yz55oA@mail.gmail.com>
References: <20231027165841.71810-1-jose.pekkarinen@foxhound.fi>
 <BL1PR12MB5144FA51BCB5DFD9A9F88A5BF7DCA@BL1PR12MB5144.namprd12.prod.outlook.com>
 <634f769b7f723795180d5bd2186943b9@foxhound.fi>
 <CADnq5_M237bNMn=RZvBvPm4vymmUO07Xum7OQehhtAq2Yz55oA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <8e97338fecfe92eec24c2bc27d6e9eac@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.241.208.71
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3654389624392164959
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeehieduleeufeeggfeuhefgueekjeegtdehudefvdduteefudevkeelfeduheejtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddukeehrddvgedurddvtdekrdejuddpudehuddrkedtrddvledrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-31 17:45, Alex Deucher wrote:
> On Sat, Oct 28, 2023 at 8:05 AM José Pekkarinen
> <jose.pekkarinen@foxhound.fi> wrote:
>> 
>> On 2023-10-27 20:55, Deucher, Alexander wrote:
>> > [Public]
>> >
>> >> -----Original Message-----
>> >> From: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> >> Sent: Friday, October 27, 2023 12:59 PM
>> >> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> >> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> >> skhan@linuxfoundation.org
>> >> Cc: José Pekkarinen <jose.pekkarinen@foxhound.fi>; airlied@gmail.com;
>> >> daniel@ffwll.ch; amd-gfx@lists.freedesktop.org; dri-
>> >> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
>> >> linux-kernel-
>> >> mentees@lists.linuxfoundation.org
>> >> Subject: [PATCH] drm/radeon: replace 1-element arrays with
>> >> flexible-array
>> >> members
>> >>
>> >> Reported by coccinelle, the following patch will move the following 1
>> >> element
>> >> arrays to flexible arrays.
>> >>
>> >> drivers/gpu/drm/radeon/atombios.h:5523:32-48: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:5545:32-48: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:5461:34-44: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4447:30-40: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4236:30-41: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7044:24-37: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7054:24-37: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7095:28-45: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7553:8-17: WARNING use
>> >> flexible-array
>> >> member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7559:8-17: WARNING use
>> >> flexible-array
>> >> member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:3896:27-37: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:5443:16-25: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:5454:34-43: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4603:21-32: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:6299:32-44: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4628:32-46: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:6285:29-39: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4296:30-36: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4756:28-36: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:4064:22-35: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7327:9-24: WARNING use
>> >> flexible-array
>> >> member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7332:32-53: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:6030:8-17: WARNING use
>> >> flexible-array
>> >> member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7362:26-41: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7369:29-44: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7349:24-32: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >> drivers/gpu/drm/radeon/atombios.h:7355:27-35: WARNING use flexible-
>> >> array member instead
>> >> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-
>> >> length-and-one-element-arrays)
>> >>
>> >> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> >
>> > Please verify that changing these to variable sized arrays does not
>> > break any calculations based on the old size in the driver.  More
>> > below.
>> >
>> >> ---
>> >>  drivers/gpu/drm/radeon/atombios.h | 54
>> >> +++++++++++++++----------------
>> >>  1 file changed, 27 insertions(+), 27 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/radeon/atombios.h
>> >> b/drivers/gpu/drm/radeon/atombios.h
>> >> index 8a6621f1e82c..7fa1606be92c 100644
>> >> --- a/drivers/gpu/drm/radeon/atombios.h
>> >> +++ b/drivers/gpu/drm/radeon/atombios.h
>> >> @@ -3893,7 +3893,7 @@ typedef struct _ATOM_GPIO_PIN_ASSIGNMENT
>> >> typedef struct _ATOM_GPIO_PIN_LUT  {
>> >>    ATOM_COMMON_TABLE_HEADER  sHeader;
>> >> -  ATOM_GPIO_PIN_ASSIGNMENT   asGPIO_Pin[1];
>> >> +  ATOM_GPIO_PIN_ASSIGNMENT   asGPIO_Pin[];
>> >>  }ATOM_GPIO_PIN_LUT;
>> >>
>> >>
>> >> /******************************************************************
>> >> **********/
>> >> @@ -4061,7 +4061,7 @@ typedef struct
>> >> _ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT         //usSrcDstTableOffset
>> >>    UCHAR               ucNumberOfSrc;
>> >>    USHORT              usSrcObjectID[1];
>> >>    UCHAR               ucNumberOfDst;
>> >> -  USHORT              usDstObjectID[1];
>> >> +  USHORT              usDstObjectID[];
>> >>  }ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT;
>> >>
>> >>
>> >> @@ -4233,7 +4233,7 @@ typedef struct
>> >> _ATOM_CONNECTOR_DEVICE_TAG_RECORD
>> >>    ATOM_COMMON_RECORD_HEADER   sheader;
>> >>    UCHAR                       ucNumberOfDevice;
>> >>    UCHAR                       ucReserved;
>> >> -  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[1];         //This Id is
>> >> same as
>> >> "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
>> >> +  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[];          //This Id is
>> >> same as
>> >> "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
>> >>  }ATOM_CONNECTOR_DEVICE_TAG_RECORD;
>> >>
>> >>
>> >> @@ -4293,7 +4293,7 @@ typedef struct
>> >> _ATOM_OBJECT_GPIO_CNTL_RECORD
>> >>    ATOM_COMMON_RECORD_HEADER   sheader;
>> >>    UCHAR                       ucFlags;                // Future
>> >> expnadibility
>> >>    UCHAR                       ucNumberOfPins;         // Number of
>> >> GPIO pins used to
>> >> control the object
>> >> -  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[1];              // the real
>> >> gpio pin pair
>> >> determined by number of pins ucNumberOfPins
>> >> +  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[];               // the real
>> >> gpio pin pair
>> >> determined by number of pins ucNumberOfPins
>> >>  }ATOM_OBJECT_GPIO_CNTL_RECORD;
>> >>
>> >>  //Definitions for GPIO pin state
>> >> @@ -4444,7 +4444,7 @@ typedef struct
>> >> _ATOM_BRACKET_LAYOUT_RECORD
>> >>    UCHAR                       ucWidth;
>> >>    UCHAR                       ucConnNum;
>> >>    UCHAR                       ucReserved;
>> >> -  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[1];
>> >> +  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[];
>> >>  }ATOM_BRACKET_LAYOUT_RECORD;
>> >>
>> >>
>> >> /******************************************************************
>> >> **********/
>> >> @@ -4600,7 +4600,7 @@ typedef struct  _ATOM_I2C_VOLTAGE_OBJECT_V3
>> >>     UCHAR    ucVoltageControlAddress;
>> >>     UCHAR    ucVoltageControlOffset;
>> >>     ULONG    ulReserved;
>> >> -   VOLTAGE_LUT_ENTRY asVolI2cLut[1];        // end with 0xff
>> >> +   VOLTAGE_LUT_ENTRY asVolI2cLut[];         // end with 0xff
>> >>  }ATOM_I2C_VOLTAGE_OBJECT_V3;
>> >>
>> >>  // ATOM_I2C_VOLTAGE_OBJECT_V3.ucVoltageControlFlag
>> >> @@ -4625,7 +4625,7 @@ typedef struct
>> >> _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
>> >>     UCHAR    ucLeakageEntryNum;           // indicate the entry number
>> >> of
>> >> LeakageId/Voltage Lut table
>> >>     UCHAR    ucReserved[2];
>> >>     ULONG    ulMaxVoltageLevel;
>> >> -   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[1];
>> >> +   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[];
>> >>  }ATOM_LEAKAGE_VOLTAGE_OBJECT_V3;
>> >>
>> >>
>> >> @@ -4753,7 +4753,7 @@ typedef struct _ATOM_POWER_SOURCE_INFO  {
>> >>               ATOM_COMMON_TABLE_HEADER                asHeader;
>> >>               UCHAR
>> >>                                       asPwrbehave[16];
>> >> -             ATOM_POWER_SOURCE_OBJECT                asPwrObj[1];
>> >> +             ATOM_POWER_SOURCE_OBJECT                asPwrObj[];
>> >>  }ATOM_POWER_SOURCE_INFO;
>> >>
>> >>
>> >> @@ -5440,7 +5440,7 @@ typedef struct _ATOM_FUSION_SYSTEM_INFO_V2
>> >> typedef struct _ATOM_I2C_DATA_RECORD  {
>> >>    UCHAR         ucNunberOfBytes;
>> >>         //Indicates how many
>> >> bytes SW needs to write to the external ASIC for one block, besides to
>> >> "Start"
>> >> and "Stop"
>> >> -  UCHAR         ucI2CData[1];
>> >>         //I2C data in bytes,
>> >> should be less than 16 bytes usually
>> >> +  UCHAR         ucI2CData[];
>> >>         //I2C data in bytes, should
>> >> be less than 16 bytes usually
>> >>  }ATOM_I2C_DATA_RECORD;
>> >>
>> >>
>> >> @@ -5451,14 +5451,14 @@ typedef struct
>> >> _ATOM_I2C_DEVICE_SETUP_INFO
>> >>    UCHAR                                      ucSSChipID;
>> >> //SS chip being used
>> >>    UCHAR                                      ucSSChipSlaveAddr;
>> >> //Slave Address to
>> >> set up this SS chip
>> >>    UCHAR                           ucNumOfI2CDataRecords;  //number of
>> >> data block
>> >> -  ATOM_I2C_DATA_RECORD            asI2CData[1];
>> >> +  ATOM_I2C_DATA_RECORD            asI2CData[];
>> >>  }ATOM_I2C_DEVICE_SETUP_INFO;
>> >>
>> >>
>> >> //=================================================================
>> >> =========================
>> >>  typedef struct  _ATOM_ASIC_MVDD_INFO
>> >>  {
>> >>    ATOM_COMMON_TABLE_HEADER         sHeader;
>> >> -  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[1];
>> >> +  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[];
>> >>  }ATOM_ASIC_MVDD_INFO;
>> >>
>> >>
>> >> //=================================================================
>> >> =========================
>> >> @@ -5520,7 +5520,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO
>> >> typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V2  {
>> >>    ATOM_COMMON_TABLE_HEADER         sHeader;
>> >> -  ATOM_ASIC_SS_ASSIGNMENT_V2           asSpreadSpectrum[1];
>> >> //this is point only.
>> >> +  ATOM_ASIC_SS_ASSIGNMENT_V2           asSpreadSpectrum[];
>> >> //this is point only.
>> >>  }ATOM_ASIC_INTERNAL_SS_INFO_V2;
>> >>
>> >>  typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3 @@ -5542,7 +5542,7 @@
>> >> typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3  typedef struct
>> >> _ATOM_ASIC_INTERNAL_SS_INFO_V3  {
>> >>    ATOM_COMMON_TABLE_HEADER         sHeader;
>> >> -  ATOM_ASIC_SS_ASSIGNMENT_V3           asSpreadSpectrum[1];
>> >> //this is pointer only.
>> >> +  ATOM_ASIC_SS_ASSIGNMENT_V3           asSpreadSpectrum[];
>> >> //this is pointer only.
>> >>  }ATOM_ASIC_INTERNAL_SS_INFO_V3;
>> >>
>> >>
>> >> @@ -6027,7 +6027,7 @@ typedef struct _ENABLE_SCALER_PARAMETERS
>> >>    UCHAR ucScaler;            // ATOM_SCALER1, ATOM_SCALER2
>> >>    UCHAR ucEnable;            // ATOM_SCALER_DISABLE or
>> >> ATOM_SCALER_CENTER or ATOM_SCALER_EXPANSION
>> >>    UCHAR ucTVStandard;        //
>> >> -  UCHAR ucPadding[1];
>> >> +  UCHAR ucPadding[];
>> >
>> > This may actually be a 1 element array.  It’s just padding at the end
>> > of the table.
>> >
>> >>  }ENABLE_SCALER_PARAMETERS;
>> >>  #define ENABLE_SCALER_PS_ALLOCATION ENABLE_SCALER_PARAMETERS
>> >>
>> >> @@ -6282,7 +6282,7 @@ typedef union
>> >> _ATOM_MEMORY_SETTING_ID_CONFIG_ACCESS
>> >>
>> >>  typedef struct _ATOM_MEMORY_SETTING_DATA_BLOCK{
>> >>       ATOM_MEMORY_SETTING_ID_CONFIG_ACCESS
>> >>       ulMemoryID;
>> >> -     ULONG
>> >>
>> >> aulMemData[1];
>> >> +     ULONG
>> >>
>> >> aulMemData[];
>> >>  }ATOM_MEMORY_SETTING_DATA_BLOCK;
>> >>
>> >>
>> >> @@ -6296,7 +6296,7 @@ typedef struct _ATOM_INIT_REG_BLOCK{
>> >>       USHORT
>> >>                                               usRegIndexTblSize;
>> >>
>> >>                       //size of asRegIndexBuf
>> >>       USHORT
>> >>                                               usRegDataBlkSize;
>> >>
>> >>                               //size of
>> >> ATOM_MEMORY_SETTING_DATA_BLOCK
>> >>       ATOM_INIT_REG_INDEX_FORMAT
>> >>       asRegIndexBuf[1];
>> >> -     ATOM_MEMORY_SETTING_DATA_BLOCK  asRegDataBuf[1];
>> >> +     ATOM_MEMORY_SETTING_DATA_BLOCK  asRegDataBuf[];
>> >>  }ATOM_INIT_REG_BLOCK;
>> >>
>> >
>> > This one needs special handling as you have multiple variable sized
>> > arrays.
>> 
>>      I'm happy to add any special handling in v2, though
>> I may need to understand what that special handling would
>> be. Would you mind to elaborate? Otherwise I can just leave
>> the sensitive cases and the paddings untouched and resend
>> the patch with the rest of cases converted.
> 
> 
> I'm not sure how we want to handle back to back variable sized arrays.
> I'd say just skip these cases for now.

     Very good, I'll be sending v2 soon. thanks for the comments!

     José.
